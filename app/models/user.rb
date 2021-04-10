class User < ActiveRecord::Base
    has_many :chore
    has_secure_password
end