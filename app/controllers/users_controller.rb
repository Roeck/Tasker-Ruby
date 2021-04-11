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

  # Find authenticated user and redirect it to tasks view:

  post "/signin" do
    @user = User.find_by(:name => params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/tasks"

  # Else, if the user is not authenticated, alert error message:

    else
      flash[:message1] = "This user does not exist!"
      redirect "/signin"
    end
  end

  # -------------- SIGN OUT -------------- #

  # If user signs out, destroy current session:

  get "/signout" do
    if signed_in?
      session.destroy

  # Then, redirect it to sign in form:

      redirect "/signin"
    end
  end

end


