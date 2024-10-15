# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = {name: "Dishoom", address: "7 Boundary St, London E2 7JE", category: "chinese"}
pizza_east =  {name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", category: "italian"}

restaurants = [
  {name: "Dishoom", address: "7 Boundary St, London E2 7JE", category: "chinese"},
  {name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", category: "italian"},
  {name: "Sushiya", address: "10 Hanbury St, London E1 6QR", category: "japanese"},
  {name: "Le Bistro", address: "22 Rue du Faubourg, Paris 75009", category: "french"},
  {name: "Waffle House", address: "18 Avenue Louise, Brussels 1050", category: "belgian"},
  {name: "Little Tokyo", address: "15 Oxford St, London W1D 1AU", category: "japanese"},
  {name: "La Trattoria", address: "8 Rue de Vaugirard, Paris 75006", category: "italian"},
  {name: "Peking Duck", address: "25 Kensington High St, London W8 5NP", category: "chinese"},
  {name: "Chez Pierre", address: "5 Place des Vosges, Paris 75003", category: "french"},
  {name: "Brussels Café", address: "42 Rue de la Régence, Brussels 1000", category: "belgian"}
];

restaurants.each do |attributes|
  restaurant = Restaurant.create!(attributes)
  review = Review.new({content: "#{ restaurant.name } is very good!", rating: 5 })
  review.restaurant = restaurant
  review.save
  puts "Created #{restaurant.name}"
end
puts "Finished!"
