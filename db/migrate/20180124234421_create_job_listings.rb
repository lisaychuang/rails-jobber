class CreateJobListings < ActiveRecord::Migration
  def change
    create_table :job_listings do |t|
      t.string :title
      t.text :summary
      t.text :description
      t.text :qualifications
      t.string :url

      t.timestamps null: false
    end
  end
end
