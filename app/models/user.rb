class User < ActiveRecord::Base
    has_many :applications
    has_many :work_experiences 
    
    def full_name
        self.first_name + ' ' + self.last_name 
    end
end
