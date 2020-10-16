# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all

50.times do |index|
  product = Product.create!(name: Faker::Food.ingredient, cost: rand(0.01..29.99), country_of_origin: Faker::Address.country)
  5.times do |index|
    product.reviews.create!(title: Faker::Marketing.buzzwords, rating: rand(1..5), author: Faker::Name.unique.name, content_body: Faker::Lorem.characters(number: 100), product_id: product.id)
  end
end

p "Created #{Product.count} products and #{Review.count} reviews"