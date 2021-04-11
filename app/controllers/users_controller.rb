class UsersController < ApplicationController

  # -------------- SIGN UP -------------- #

  # Routing:

  get "/signup" do
    erb :"/users/signup.html"
  end

  # If Signup form submits empty inputs, alert requirement to user and refresh page:

  post "/signup" do
    if params[:name].empty? || params[:email].empty? || params[:password].empty?
      redirect "/signup"

  # Else, create a new instance of user using params and redirect to tasks page:
    
    else
      @user = User.create(
      :name => params[:name],
      :email => params[:email],
      :password => params[:password])
      session[:user_id] = @user.id     
      redirect "/tasks"
    end
  end

  # If user is signed up, redirect to tasks page:

  get "/tasks" do
    @users = User.all
    erb :'/tasks/tasks.html'
  end

  # -------------- SIGN IN -------------- #

  # Routing:

  get "/signin" do   
    erb :"/users/signin.html"
  end

end


