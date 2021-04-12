class TasksController < ApplicationController
    get "/tasks" do
        erb :"/tasks/tasks"
    end
end