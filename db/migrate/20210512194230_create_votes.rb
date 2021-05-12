class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.integer :vehicle_id
      t.integer :user_id
    end
    add_foreign_key :votes, :users, column: :user_id
    add_foreign_key :votes, :vehicles, column: :vehicle_id
  end
end
