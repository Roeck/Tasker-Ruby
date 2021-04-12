class TasksController < ApplicationController
    
    # Tasks view route:

    get "/tasks" do
        erb :"/tasks/tasks"
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

end