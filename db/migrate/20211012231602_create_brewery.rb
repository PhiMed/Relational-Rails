class CreateBrewery < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :number_of_employees
      t.boolean :employee_owned
    end
  end
end
