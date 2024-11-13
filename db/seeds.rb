# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
require 'faker'

puts 'cleaning the databse'
Restaurant.destroy_all

puts 'seeding the database'
5.times do
  # reviews_array = []
  # 3.times do
  #   review = Review.new(
  #     content: Faker::Restaurant.review,
  #     rating: [0..5].sample
  #   )
  #   reviews_array << review
  # end
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::Number.number(digits: 10),
    category: %w[chinese italian japanese french belgian].sample,
    # reviews: reviews_array
    )
  restaurant.save
end

puts "#{Restaurant.count} restaurants created!"
