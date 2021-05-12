class AddColumnToVehicle < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :user_id, :integer
    add_column :vehicles, :fuel_type, :string
    add_column :vehicles, :model, :date
    add_column :vehicles, :make, :string
    add_column :vehicles, :vehicle_conditions, :text
    add_column :vehicles, :avatar, :string
  end
end
