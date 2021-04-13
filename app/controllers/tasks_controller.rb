class TasksController < ApplicationController
    
    # Tasks view route:

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
        # Params {"chore"=>"raise params inspect"}:
        if signed_in?
        @user = User.find(session[:user_id])

        if params[:chore].empty?
            redirect "/tasks/new"
        else
            @user = User.find_by(:id => session[:user_id])
            # Create new instance of task:
            @task = Task.new
            # Set the name of chore:
            @task.chore = params[:chore]
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

    get "/tasks/:id" do
        @task = Task.find(params[:id])
        erb :"/tasks/edit.html"
    end

end