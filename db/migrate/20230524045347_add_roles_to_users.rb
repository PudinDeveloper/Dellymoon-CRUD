class AddRolesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer, default: 1
  end
end
