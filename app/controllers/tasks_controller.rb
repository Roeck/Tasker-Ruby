class TasksController < ApplicationController
    
    # TASKS ROUTE:

    get "/tasks" do

        # If signed in, redirect user to tasks view:
        if signed_in?
        @user = User.find(session[:user_id])

        # Task.where(name: name)
        # @user = User.joins(:tasks).where(tasks: {user_id: @user})
        @tasks = Task.where(user_id: current_user)

        # Task.find_or_create_by(@user.id)
        # find_by
        erb :"tasks/tasks.html"

        # Else, send it to sign in form:
        else
        redirect "/signin"
        end
    end

    # New task route, if user is signed in:
    get "/tasks/new" do
        if signed_in?
            @user = User.find_by(id: session[:user_id])
            erb :"/tasks/new.html"

        # If not signed in, redirect user to sign in page:
        else
            redirect "/signin"
        end
    end

    # Fetching and displaying tasks:
    post "/tasks" do

        # Raise params.inspect,
        # Params {"task"=>"raise params inspect"}:
        if signed_in?
        @user = User.find(session[:user_id])

        if params[:task].empty?
            redirect "/tasks/new"
        else
            @user = User.find_by(:id => session[:user_id])
            
            # Create new instance of task:
            @task = Task.new

            # Set the name of task:
            @task.task = params[:task]

            # Save it:
            @task.user_id = @user.id
            @task.save
            redirect "/tasks"
        end

        else
        redirect "/signin"
        end
    end

    # TASKS EDIT

    # Find user id and task id through params:
    get "/tasks/:id" do
        @user = User.find_by(id: session[:user_id])
        @task = Task.find(params[:id])

     # If both are found, redirect them to Tasks Edit:
        erb :"/tasks/edit.html"
    end

    # Patch current task's session:
    patch "/tasks/:id" do

    # Find user and task by current session:
        User.find_by(id: session[:user_id]) if session[:user_id]
        @task = Task.find(params[:id])
        @task.update(task: params[:task])

    # When identified, redirect to Tasks page:
        redirect "/tasks"
    end

    # DELETE TASKS:
    
    # Find task's id:
    delete "/tasks/:id/delete" do
        User.find_by(id: session[:user_id]) if session[:user_id]
        @task = Task.find(params[:id])
    
    # If found, destroy it and redirect to Tasks page:
        @task.destroy
        redirect "/tasks"
    end

end