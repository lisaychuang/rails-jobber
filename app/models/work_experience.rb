class WorkExperience < ActiveRecord::Base
    belongs_to :user

    # Validations 
    validates :employer, :title, :location, :start_date, :end_date, :experience, presence: true
    validates :employer, length: { minimum: 2 }
    validates :experience, length: { maximum: 500,
                                     too_long: "500 characters is the maximum allowed" }
    validates :ranking, numericality: { only_integer: true }
end
