class CreateRewardTakeups < ActiveRecord::Migration
  def change
    create_table :reward_takeups do |t|
      t.belongs_to :reward, index: true
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :reward_takeups, :rewards
    add_foreign_key :reward_takeups, :users
  end
end
