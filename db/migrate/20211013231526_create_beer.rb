class CreateBeer < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.integer :vendor_lead_time
      t.boolean :bottled

      t.timestamps
    end
  end
end
