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

Channel.create!(sub_id: 1, title: "Furnishing")
Channel.create!(sub_id: 1, title: "Decorating")
Channel.create!(sub_id: 1, title: "Cleaning")
Channel.create!(sub_id: 1, title: "Jewelry")
Channel.create!(sub_id: 1, title: "Kitchen")

Channel.create!(sub_id: 2, title: "Cell Phones")
Channel.create!(sub_id: 2, title: "Computers")
Channel.create!(sub_id: 2, title: "Clocks")
Channel.create!(sub_id: 2, title: "Electronics")
Channel.create!(sub_id: 2, title: "Gadgets")

Channel.create!(sub_id: 3, title: "Bookshelves")
Channel.create!(sub_id: 3, title: "Cars")
Channel.create!(sub_id: 3, title: "Furniture")
Channel.create!(sub_id: 3, title: "Gardening")
Channel.create!(sub_id: 3, title: "Home Renovation")

Channel.create!(sub_id: 4, title: "BBQ & Grilling")
Channel.create!(sub_id: 4, title: "Cake Decorating")
Channel.create!(sub_id: 4, title: "Vegetarian and Vegan")
Channel.create!(sub_id: 4, title: "Pie")
Channel.create!(sub_id: 4, title: "Main Course")

Channel.create!(sub_id: 5, title: "Costumes")
Channel.create!(sub_id: 5, title: "Instruments")
Channel.create!(sub_id: 5, title: "Music")
Channel.create!(sub_id: 5, title: "Puzzles")
Channel.create!(sub_id: 5, title: "Toys")

Channel.create!(sub_id: 6, title: "Bikes")
Channel.create!(sub_id: 6, title: "Boats")
Channel.create!(sub_id: 6, title: "Fishing")
Channel.create!(sub_id: 6, title: "Camping")
Channel.create!(sub_id: 6, title: "Birding")



Post.create!(title: "Decorate My Own Kitchen", body: "I did it all by myself!", user_id: 1, sub_id: 1)
Post.create!(title: "Decorate My Own Bathroom", body: "I did it all by myself!", user_id: 1, sub_id: 1)
Post.create!(title: "Make My Own Coffee Table", body: "I did it all by myself!", user_id: 1, sub_id: 1)



