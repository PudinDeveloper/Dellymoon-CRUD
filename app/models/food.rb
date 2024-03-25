class Food < ApplicationRecord
  validates :name, presence: true
  validates :quantity, presence: true
  validates :price, presence: true
  validates :food_type, presence: true

  # This method returns a list of food types.
  def self.food_types
    ['Main dish', 'Drink', 'Dessert']
  end
end
