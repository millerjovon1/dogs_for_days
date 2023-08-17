require 'yaml'
require 'open-uri'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning the DB..."
Dog.destroy_all
User.destroy_all

# puts "Creating prisons..."
# prison = Prison.create!(
#   banner_url: 'https://upload.wikimedia.org/wikipedia/commons/f/f3/Alcatraz_Island_photo_Don_Ramey_Logan.jpg',
#   name: 'Alcatraz'
# )
# puts "... created #{Prison.count} prisons"

puts "Creating users..."
 devi = User.create(first_name: "Devi", last_name: "Putri", email:"devi.putri@live.com", password: "123123")
 jovon = User.create(first_name: "Jovon", last_name: "Miller", email:"millerjovon1@gmail.com", password: "123123")
 gabi = User.create(first_name: "Gabi", last_name: "Smear", email:"gabriellesmer@gmail.com",password:"123123")
 lili = User.create(first_name: "Lili", last_name: "Banks", email:"lili88banks@icloud.com", password:"123123" )

 20.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name:Faker::Name.last_name,
    email: Faker::Internet.email,
    password:"123123"
  )
end



puts "... created #{User.count} users"

puts "Creating dogs...."
# dogs = [
#   'Dozo',
#   'Navi',
#   'Terrance',
#   'Rambo',
#   'Here we go',
#   'Dezai',
#   'Gojo',
#   'Cuujo',
#   'Scrumple',
# ]

addresses_url = 'https://gist.githubusercontent.com/trouni/599e03440e2552e803c54c62916f874c/raw/cc7aff8deeb27c3f22ee501b6723766a8cb68f2b/addresses.yml'
serialized_addresses = URI.open(addresses_url).read
addresses = YAML.load(serialized_addresses)

User.all.each do |user|
  Dog.create!(
    name: Faker::Creature::Horse.unique.name,
    breed: Faker::Creature::Dog.breed,
    age: Faker::Creature::Dog.age,
    size: Faker::Creature::Dog.size,
    price: Faker::Commerce.price,
    location: addresses.sample,
    image_url: "http://source.unsplash.com/featured/?dog>&#{rand(1000)}",
    user: user
  )
end

Dog.all.each do |dog|
  Booking.create(
    start_date: Date.today + rand(1..5),
    end_date: Date.today + rand(5..10),
    dog: dog,
    user: User.where.not(id: dog.user).sample
  )
end
puts "... created #{Dog.count} dogs"
