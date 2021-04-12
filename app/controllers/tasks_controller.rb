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
end