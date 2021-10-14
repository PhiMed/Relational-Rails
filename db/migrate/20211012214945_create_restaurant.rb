class CreateRestaurant < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :seats
      t.boolean :serve_liquor

      t.timestamps
    end
  end
end
