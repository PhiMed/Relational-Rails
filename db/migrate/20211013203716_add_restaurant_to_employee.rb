class AddRestaurantToEmployee < ActiveRecord::Migration[5.2]
  def change
    add_reference :employees, :restaurant, foreign_key: true
  end
end
