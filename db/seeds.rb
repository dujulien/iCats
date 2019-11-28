# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'table_print'
Item.destroy_all


9.times do
Item.create(title: Faker::Creature::Cat.name, description: Faker::Creature::Cat.breed, price: Faker::Number.decimal(l_digits: 2), image_url: "<img src='i+1.png' alt''/>")
end
tp Item.all

5.times do
	User.create(name: Faker::Name.first_name, email: Faker::Internet.email, password: "AZERTY" )
end

tp Cart.all


5.times do |i|
	5.times do |j|
		CartContent.create(cart: Cart.find(i+1), item: Item.find(rand(1..9)))
	end
end

tp CartContent.all

5.times do |i|
	Order.create(user: User.find(i+1))
end
tp Order.all


5.times do |i|
	5.times do |j|
		JointTableOrderItem.create(order: Order.find(i+1), item: Item.find(rand(1..9)))
	end
end
tp JointTableOrderItem.all


