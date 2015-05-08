class CreateRewards < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.belongs_to :product, index: true
      t.string :offer_type
      t.integer :min_circle_size
      t.integer :min_circle_points
      t.string :title
      t.integer :points_cost
      t.float :discount
      t.string :desc1
      t.string :desc2
      t.string :artwork_filename
      t.string :status

      t.timestamps null: false
    end
    add_foreign_key :rewards, :products
  end
end
