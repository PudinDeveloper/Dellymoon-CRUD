class CreateOrderFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :order_foods do |t|
      t.integer :food_id
      t.integer :ticket_id
      t.integer :status, :null => false, :default => 1

      t.timestamps
    end
  end
end
