class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.belongs_to :role, index: true
      t.belongs_to :circle, index: true
      t.string :address
      t.string :phone_number
      t.date :dob

      t.timestamps null: false
    end
    add_foreign_key :users, :roles
    add_foreign_key :users, :circles
  end
end
