class CreatePolicies < ActiveRecord::Migration
  def change
    create_table :policies do |t|
      t.belongs_to :user, index: true
      t.belongs_to :product, index: true
      t.string :policy_number
      t.float :premium
      t.string :frequency
      t.string :status

      t.timestamps null: false
    end
    add_foreign_key :policies, :users
    add_foreign_key :policies, :products
  end
end
