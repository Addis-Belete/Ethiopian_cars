class CreateVehicles < ActiveRecord::Migration[6.1]
  def change
    create_table :vehicles do |t|
      t.string :name
      t.string :price
      t.string :category_id

      t.timestamps
    end
  end
end
