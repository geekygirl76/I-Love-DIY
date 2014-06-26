# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(username:"tomato", password:"tomato", email:"tomato@abc")
User.create!(username:"pepper", password:"pepper", email:"pepper@abc")
User.create!(username:"potato", password:"potato", email:"potato@abc")

Sub.create!(user_id: 1, title: "Living")
Sub.create!(user_id: 1, title: "Technology")
Sub.create!(user_id: 1, title: "Workshop")
Sub.create!(user_id: 1, title: "Food")
Sub.create!(user_id: 1, title: "Play")
Sub.create!(user_id: 1, title: "Outside")

Channel.create!(sub_id: 16, title: "Furnishing")
Channel.create!(sub_id: 16, title: "Decorating")
Channel.create!(sub_id: 16, title: "Cleaning")
Channel.create!(sub_id: 16, title: "Jewelry")
Channel.create!(sub_id: 16, title: "Kitchen")

Channel.create!(sub_id: 17, title: "Cell Phones")
Channel.create!(sub_id: 17, title: "Computers")
Channel.create!(sub_id: 17, title: "Clocks")
Channel.create!(sub_id: 17, title: "Electronics")
Channel.create!(sub_id: 17, title: "Gadgets")

Channel.create!(sub_id: 18, title: "Bookshelves")
Channel.create!(sub_id: 18, title: "Cars")
Channel.create!(sub_id: 18, title: "Furniture")
Channel.create!(sub_id: 18, title: "Gardening")
Channel.create!(sub_id: 18, title: "Home Renovation")

Channel.create!(sub_id: 19, title: "BBQ & Grilling")
Channel.create!(sub_id: 19, title: "Cake Decorating")
Channel.create!(sub_id: 19, title: "Vegetarian and Vegan")
Channel.create!(sub_id: 19, title: "Pie")
Channel.create!(sub_id: 19, title: "Main Course")

Channel.create!(sub_id: 20, title: "Costumes")
Channel.create!(sub_id: 20, title: "Instruments")
Channel.create!(sub_id: 20, title: "Music")
Channel.create!(sub_id: 20, title: "Puzzles")
Channel.create!(sub_id: 20, title: "Toys")

Channel.create!(sub_id: 21, title: "Bikes")
Channel.create!(sub_id: 21, title: "Boats")
Channel.create!(sub_id: 21, title: "Fishing")
Channel.create!(sub_id: 21, title: "Camping")
Channel.create!(sub_id: 21, title: "Birding")







