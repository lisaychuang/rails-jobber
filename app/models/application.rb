class Application < ActiveRecord::Base
    belongs_to :user
    belongs_to :job_listing

    # Validations
    validates :cover_letter, presence: true,
                             length: { maximum: 1000, 
                                       too_long: "1000 characters is the maximum allowed" }
end
