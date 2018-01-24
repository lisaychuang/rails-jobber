class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.text :cover_letter
      t.string :status
      t.datetime :submit_date
      t.integer :user_id
      t.integer :job_listing_id

      t.timestamps 
    end
  end
end
