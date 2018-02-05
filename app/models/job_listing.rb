class JobListing < ActiveRecord::Base
    has_many :applications
    has_many :users, through: :applications

    scope :open, -> {where(status:true)} 
    scope :closed, -> {where(status:false)} 
end