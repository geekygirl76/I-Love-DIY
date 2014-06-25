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
Channel.create!(sub_id: 2, title: "Cell Phones")
Channel.create!(sub_id: 2, title: "Computers")

Post.create!(title: "Decorate My Own Kitchen", body: "I did it all by myself!", user_id: 1, sub_id: 1)
Post.create!(title: "Decorate My Own Bathroom", body: "I did it all by myself!", user_id: 1, sub_id: 1)
Post.create!(title: "Make My Own Coffee Table", body: "I did it all by myself!", user_id: 1, sub_id: 1)



