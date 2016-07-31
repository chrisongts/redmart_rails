# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.create!(name:  "admin",
#              email: "admin@redmart.com",
#              password:              "@dmin",
#              password_confirmation: "@dmin",
#              admin: true)
#
# 20.times do |n|
#   name  = Faker::Name.name
#   email = Faker::Internet.email
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              "password",
#                password_confirmation: "password")
# end

# Product.create(name: "Kee Song Fresh Boneless Chicken Breasts",
#                brand_id: "Kee Song",
#                category_id: "Meat - Chicken",
#                price: 6.60)
# Product.create(name: "Scott Virgin Fiber Towels",
#               brand_id: "Scott",
#               category_id: "MCK0001",
#               price: 4.95)
# Product.create(name: "Hoegaarden Belgian White Beer Can",
#                brand_id: "Hoegaarden",
#                category_id: "BHG0001",
#                price: 6.60)
# Product.create(name: "Owl 3-in-1 Strong Instant Coffee",
#               brand_id: "Owl",
#               category_id: "OC30001",
#               price: 6.50)
# Product.create(name: "Sunshine Softgrain Wholemeal Bread",
#               brand_id: "Sunshine",
#               category_id: "SBW0001",
#               price: 2.60)
# Product.create(name: "Marigold Low Fat Cup Yoghurt - Natural",
#               brand_id: "Marigold",
#               category_id: "MYL0001",
#               price: 2.60)
# Product.create(name: "Haagen-Dazs Macadamia Nut Ice Cream",
#               brand_id: "Haagen-Dazs",
#               category_id: "HDI0001",
#               price: 14.45)

Review.create(content: "Haagen-Dazs Macadamia Nut Ice Cream is very good. It is creamy",
              user_id: 22,
              product_id: 7)
