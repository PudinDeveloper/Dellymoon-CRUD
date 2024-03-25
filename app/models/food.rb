class Food < ApplicationRecord
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :food_type, presence: true

  # Validate that price is a number and greater or equal to 0.
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # Validate that quantity is a number and greater than 0.
  validates :quantity, numericality: { greater_than: 0 }

  # This method returns a list of food types.
  def self.food_types
    ['Main dish', 'Drink', 'Dessert']
  end
end
