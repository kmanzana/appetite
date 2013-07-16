class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer :restaurant_id
      t.string :name
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end
