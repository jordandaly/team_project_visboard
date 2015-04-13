class CreateSavingsDeposits < ActiveRecord::Migration
  def change
    create_table :savings_deposits do |t|
      t.integer :amount
      t.date :date
      t.belongs_to :goal, index: true

      t.timestamps
    end
  end
end
