class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :priority
      t.integer :user_id
      t.string :fuel_type
      t.date :model
      t.string :make
      t.text :vehicle_condition

      t.timestamps
    end
  end
end
