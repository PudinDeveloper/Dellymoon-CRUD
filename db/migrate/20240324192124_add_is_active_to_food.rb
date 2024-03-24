class AddIsActiveToFood < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :isActive, :boolean, default: true, null: false
  end
end
