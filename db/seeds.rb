# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
City.destroy_all
Dog.destroy_all
DogSitter.destroy_all
Stroll.destroy_all

100.times do |index|
  City.create(city_name: Faker::Address.city)
  puts "#{index} city created"
end

100.times do |index|
  Dog.create(name: Faker::Creature::Dog.name, race: Faker::Creature::Dog.breed, city: City.find(rand(1..100)))
  DogSitter.create(name: Faker::Name.name, city: City.find(rand(1..100)))
  puts "#{index} dog and sitter created"
end

100.times do |index|
  Stroll.create(dog: Dog.find(rand(1..100)), dog_sitter: DogSitter.find(rand(1..100)), city: City.find(rand(1..100)))
  puts "#{index} stroll created"
end
