class CreateTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.integer :table
      t.float :final_price
      t.boolean :status, :null => false, :default => true
      t.integer :user_id, :null => false, :default => 1

      t.timestamps
    end
  end
end
