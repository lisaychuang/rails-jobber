class AddStatusToJobListings < ActiveRecord::Migration
  def change
    add_column :job_listings, :status, :boolean,  default: true
  end
end
