class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :price
      t.string :category_id
      t.integer :user_id
      t.string :make
      t.date :model
      t.string :fuel_type
      t.text :vehicle_conditions

      t.timestamps
    end
  end
end
