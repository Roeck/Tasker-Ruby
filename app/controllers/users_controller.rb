class UsersController < ApplicationController
  get "/signup" do
    erb :"/users/signup.html"
  end
end