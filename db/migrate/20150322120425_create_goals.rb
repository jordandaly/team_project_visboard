class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.integer :target_amount
      t.integer :user_id

      t.timestamps
    end
  end
end
