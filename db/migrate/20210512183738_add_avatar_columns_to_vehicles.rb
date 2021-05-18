class AddAvatarColumnsToVehicles < ActiveRecord::Migration[6.1]
  def up
    add_attachment :vehicles, :avatar
  end

  def down
    remove_attachment :vehicles, :avatar
  end
end
