class CreateEmployee < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :weekly_hours
      t.boolean :over_21

      t.timestamps
    end
  end
end
