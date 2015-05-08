class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.string :name
      t.string :group_code
      t.integer :points
      t.string :status

      t.timestamps null: false
    end
  end
end
