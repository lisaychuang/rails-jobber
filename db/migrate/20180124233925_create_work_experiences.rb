class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.integer :user_id
      t.string :start_date
      t.string :end_date, default: 'Present'
      t.string :title
      t.string :employer
      t.string :location
      t.text :experience
      t.integer :ranking

      t.timestamps null: false
    end
  end
end
