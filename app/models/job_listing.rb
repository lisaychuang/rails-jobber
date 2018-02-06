class JobListing < ActiveRecord::Base
    has_many :applications
    has_many :users, through: :applications

    # Validations 
    validates :company, :title, :description, :qualifications, presence: true
    validates :url, uniqueness: true
    validates :company, length: { minimum: 2 }
    validates :summary, length: { maximum: 5000,
                                     too_long: "5000 characters is the maximum allowed" },
                        allow_blank: true
    validates :description, length: { maximum: 1000,
                                     too_long: "1000 characters is the maximum allowed" }
    
    
    #Scope methods
    scope :open, -> {where(status:true)} 
    scope :closed, -> {where(status:false)} 
end