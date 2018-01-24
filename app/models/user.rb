class User < ActiveRecord::Base
    has_many :applications
    has_many :work_experiences 
    
end
