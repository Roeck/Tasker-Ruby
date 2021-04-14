<h2>Sinatra task tracker app with ActiveRecord authentication</h2>

(x) - Build an MVC Sinatra application.

    Models: 

    . User class - Attributes: 
        has_many :chores
        has_secure_password

    . Task class - Attributes:
        belongs_to :user

    Views: 
      
    . "home.html.erb" - Home page which welcomes unlogged user and contains Sign In and      Sign Out route buttons.
      
    . "Layout.erb" - Contains the app title and footer to be render on other pages using     the <%= yield => template rendering keyword.

    . "Tasks repository" - "tasks" page for displaying created tasks, along with "new        task",  "update user" and "log out" options".

    . "Users repository" - "Sign in/Sign up forms and "edit profile" page.

    Controllers:

    . "Application_controller" - Defines root route and user's authorization/session         status, including the Sinatra-Flash gem registration.

    . "Users_controller" - Sets up the routes related to the User models and users,          including their session conditions.
    
    . "Tasks_controller" - Defines the Task model related routes, views and CRUD             functionalities.

(x) - Use ActiveRecord with Sinatra:

    . Created 2 database tables through the "rake db:create_migration" command line: 
      "create_users" and "create_tasks". Then, migrated them into the schema.rb file.

(x) - Use multiple models:

    . User model:
      Contains 2 attributes: "has_many :chore" and "has_secure_password".

    . Task model:
      Contains the "belongs_to :user" attribute.

(x) - Use at least one has_many relationship on a User model and one belongs_to                  relationship on another model:

    . Added both attribues to their belonging classes.

(x) - Must have user accounts - users must be able to sign up, sign in, and sign out:

    . All options are built and rendered with MVC.

(x) - Validate uniqueness of user login attribute (username or email).

    . Applied the "empty?" method on name, email and password params. If those fields are    empty, redirect the user to Sign Up page. Same about Loggin in.

(x) - Once logged in, a user must have the ability to create, read, update and destroy the       resource that belongs_to user.

    . CRUD functionalities applied to the Task model using the "belongs_to" Rack attribute.

(x) - Ensure that users can edit and delete only their own resources - not resources             created by other users.

    . Applied by finding each session ID from the appropriate user's params hash.

(x) - Validate user input so bad data cannot be persisted to the database.

    . User cannot Sign In/Up without entering data on their fields.

(x) - BONUS: Display validation failures to user with error messages. 

    . Notification applied on Sign In page by using the sinatra-flash gem, alerting the      user that it is not registered yet.
     






    

    
      
       
    













