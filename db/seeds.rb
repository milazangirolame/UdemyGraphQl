# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
10.times do
  Post.create([{name: "#{Faker::Fallout.faction}"}, {body: "#{Faker::Hacker.say_something_smart}"}, {user_id:"#{rand(1..12)}"}])
end
10.times do
   Comment.create([{post_id:rand{1...10}}, {user_id:"#{rand(1..12)}"}, {body:"#{Faker::VForVendetta.quote}"}])
end
