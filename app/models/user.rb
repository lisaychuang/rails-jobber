require 'bcrypt'

class User < ActiveRecord::Base
    before_save { self.email = email.downcase }
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    validates :password, presence: true

    include BCrypt
    has_secure_password
    has_many :applications
    has_many :work_experiences 
    
    def full_name
        self.first_name + ' ' + self.last_name 
    end
end
