class User < ActiveRecord::Base
    has_many :task
    has_secure_password
end