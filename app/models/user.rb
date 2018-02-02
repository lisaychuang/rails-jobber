require 'bcrypt'

class User < ActiveRecord::Base
    include BCrypt
    has_secure_password
    has_many :applications
    has_many :work_experiences 
    
    def full_name
        self.first_name + ' ' + self.last_name 
    end
end
