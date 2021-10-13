class CreateRestaurant < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :seats
      t.boolean :serve_liquor
    end
  end
end
