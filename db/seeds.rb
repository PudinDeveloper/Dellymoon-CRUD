# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create foods
20.times do
  # Create a food record in the database.
  Food.create(
    name: Faker::Food.dish,
    quantity: Faker::Number.between(from: 1, to: 10),
    price: Faker::Commerce.price(range: 5.0..50.0),
    food_type: ['Main dish', 'Beverage'].sample
  )
end

# Output a success message.
puts "Foods seeded successfully!"
