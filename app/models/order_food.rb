class OrderFood < ApplicationRecord
  belongs_to :order
  belongs_to :food

  validates :quantity, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }

  def total_price
    food.price * quantity
  end
end
