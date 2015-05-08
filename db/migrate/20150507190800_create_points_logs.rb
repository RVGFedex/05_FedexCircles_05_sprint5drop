class CreatePointsLogs < ActiveRecord::Migration
  def change
    create_table :points_logs do |t|
      t.belongs_to :circle, index: true
      t.belongs_to :policy, index: true
      t.belongs_to :reward_takeup, index: true
      t.string :event_type
      t.integer :debit
      t.integer :credit
      t.integer :balance

      t.timestamps null: false
    end
    add_foreign_key :points_logs, :circles
    add_foreign_key :points_logs, :policies
    add_foreign_key :points_logs, :reward_takeups
  end
end
