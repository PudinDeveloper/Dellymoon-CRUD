# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
# Delte all the records in the foods table.
Food.destroy_all
puts "Foods destroyed successfully!"

# Create foods
7.times do
  # Create a food record in the database.
  Food.create(
    name: Faker::Food.dish,
    quantity: Faker::Number.between(from: 100.0, to: 450.0),
    price: Faker::Commerce.price(range: 5.0..50.0),
    food_type: 'Main dish'
  )

  # Create a beverage record in the database.
  Food.create(
    name: Faker::Beer.name,
    quantity: Faker::Number.between(from: 100.0, to: 450.0),
    price: Faker::Commerce.price(range: 5.0..50.0),
    food_type: 'Drink'
  )

  # Create a dessert record in the database.
  Food.create(
    name: Faker::Dessert.variety,
    quantity: Faker::Number.between(from: 100.0, to: 450.0),
    price: Faker::Commerce.price(range: 5.0..50.0),
    food_type: 'Dessert'
  )
end

# Output a success message.
puts "Foods seeded successfully!"
