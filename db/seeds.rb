# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(username:"tomato", password:"tomato", email:"tomato@abc", age:44, gender: "male", zip: "11111")
User.create!(username:"pepper", password:"pepper", email:"pepper@abc", age:44, gender: "male", zip: "11111")
User.create!(username:"potato", password:"potato", email:"potato@abc", age:44, gender: "male", zip: "11111")
User.create!(username:"hellokitty", password:"hellokitty", email:"hellokitty@abc", age: 3, gender: "female", zip: "11111")

User.first.subs.create!( title: "Living")
User.first.subs.create!( title: "Technology")
User.first.subs.create!( title: "Workshop")
User.first.subs.create!( title: "Food")
User.first.subs.create!( title: "Play")
User.first.subs.create!( title: "Outside")

Sub.find(1).channels.create!(title: "Furnishing")
Sub.find(1).channels.create!( title: "Decorating")
Sub.find(1).channels.create!( title: "Cleaning")
Sub.find(1).channels.create!( title: "Jewelry")
Sub.find(1).channels.create!( title: "Kitchen")

Sub.find(2).channels.create!( title: "Cell Phones")
Sub.find(2).channels.create!( title: "Computers")
Sub.find(2).channels.create!( title: "Clocks")
Sub.find(2).channels.create!( title: "Electronics")
Sub.find(2).channels.create!( title: "Gadgets")

Sub.find(3).channels.create!( title: "Bookshelves")
Sub.find(3).channels.create!( title: "Cars")
Sub.find(3).channels.create!( title: "Furniture")
Sub.find(3).channels.create!( title: "Gardening")
Sub.find(3).channels.create!( title: "Home Renovation")

Sub.find(4).channels.create!( title: "BBQ & Grilling")
Sub.find(4).channels.create!( title: "Cake Decorating")
Sub.find(4).channels.create!( title: "Vegetarian and Vegan")
Sub.find(4).channels.create!( title: "Pie")
Sub.find(4).channels.create!( title: "Main Course")

Sub.find(5).channels.create!( title: "Costumes")
Sub.find(5).channels.create!( title: "Instruments")
Sub.find(5).channels.create!( title: "Music")
Sub.find(5).channels.create!( title: "Puzzles")
Sub.find(5).channels.create!( title: "Toys")

Sub.find(6).channels.create!( title: "Bikes")
Sub.find(6).channels.create!( title: "Boats")
Sub.find(6).channels.create!( title: "Fishing")
Sub.find(6).channels.create!( title: "Camping")
Sub.find(6).channels.create!( title: "Birding")







