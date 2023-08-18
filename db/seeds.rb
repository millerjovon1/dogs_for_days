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
Review.destroy_all
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

description_sample = ["As an eternal optimist, I live life with an infectious enthusiasm. Whether it's a sunrise walk or a midnight snack, I'm always ready to make the most of every moment.",
  "I may be small in size, but I'm big on heart! My petite paws and giant personality are a winning combination that's sure to bring smiles to everyone I meet.",
  "With eyes that could melt glaciers and a tail that wags like there's no tomorrow, I'm a master of spreading joy. Happiness is my specialty, and I'm available for unlimited snuggles.",
  "Are you a fellow food lover? Let's embark on culinary adventures together! From tasting new treats to sharing cozy picnics, I'm your partner in gastronomic exploration.",
  "Rain or shine, I'm always up for a game of fetch or a relaxing stroll. I'm that loyal friend who will be by your side through thick and thin, no matter the weather.",
  "They say patience is a virtue, and I've mastered it to perfection. With a calm demeanor and a heart full of kindness, I'm the rock you can lean on during life's storms.",
  "Adventure awaits, and I'm ready to lead the way! Whether it's a mountain hike or a city escapade, I'm here to show you the world through my curious eyes.",
  "If you're seeking a partner in crime for spontaneous dance parties and secret hideaways, I'm your go-to companion. Let's create memories that'll last a lifetime!",
  "From fetching your favorite slippers to greeting you with a tail-wagging welcome, I take pride in being the most dedicated member of the Welcome Home committee.",
  "Rainbows, unicorns, and belly rubs—these are a few of my favorite things. My world is a magical place, and I'm here to sprinkle joy and wonder wherever I go.",
  "I'm a curious canine on a mission to sniff out all the exciting spots in the neighborhood. Let's embark on daily adventures together and discover new sights, sounds, and scents!",
  "I'm all about living life in the fast lane—or at least the fast fetch lane! When I'm not racing after tennis balls, you'll find me napping in the sun, recharging for our next playtime.",
  "If you're in the market for a furry therapist, look no further. My intuitive nature and comforting presence are here to provide endless love, tail wags, and sympathetic ear scratches.",
  "Fancy a foodie friend? Count me in! I'm known for my exceptional taste in treats and my ability to turn mealtime into a gourmet experience. Bon appétit, my human companion!",
  "The world is my playground, and every day is a chance to make new friends. Whether it's a fellow pup or a friendly squirrel, I believe in spreading joy and building connections.",
  "My superpower? Transforming rainy days into cozy cuddle sessions. With my fluffy coat and affectionate personality, I'm your go-to source of warmth and happiness.",
  "Water isn't just my element—it's my source of endless joy. Lakes, pools, sprinklers—I'm always up for a splashin' good time. Ready to dive into aquatic adventures?",
  "Got a puzzle or a tricky task? Challenge accepted! I thrive on mental stimulation and problem-solving, making me the perfect partner for games that engage both body and mind.",
  "Need a touch of mischief in your life? I'm your furry prankster, always ready with a wagging tail and a twinkle in my eye. Let's keep the laughter rolling!",
]


User.all.each do |user|
  Dog.create!(
    name: Faker::Creature::Horse.unique.name,
    breed: Faker::Creature::Dog.breed,
    age: rand(1..8),
    size: Dog::SIZES.sample,
    price: Faker::Commerce.price,
    gender: ['male', 'female'].sample,
    description: description_sample.sample,
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


content_examples = [
  "Took really good care of my dog!",
  "My dog loved them!",
  "Played so much with my dog, great rentor",
  "Took my little furbaby to the beach! Awesome!",
  "Amazing experience with this dog renter! They took care of my furry friend as if it were their own. Will definitely hire again!",
  "I'm so grateful for the attention and care my dog received from this renter. Five-star service all the way!",
  "Top-notch dog renter. My dog had a blast and came back happy and well-exercised. Highly recommend!",
  "Reliable and trustworthy renter for dogs. I was updated with pictures and messages, which put my mind at ease.",
  "Excellent communication and professionalism. Left my dog with this renter for a weekend and couldn't be happier with the experience.",
  "A fantastic dog renter who understands canine behavior. My dog made new friends and didn't want to leave!",
  "Peace of mind is priceless, and that's exactly what I got from this dog renter. 10/10 would book again.",
  "If you're looking for someone to love and care for your dog while you're away, this is the renter to choose.",
  "Wonderful environment for dogs. Clean, spacious, and filled with positive energy. My dog can't wait to go back!",
  "I was hesitant at first, but this dog renter exceeded all my expectations. My dog came home happy and healthy.",
  "The dog rental experience was fantastic! Our pup came back tired and happy. Thank you to the wonderful renter!",
  "I was amazed by the personalized attention my dog received from this renter. It's clear they have a genuine love for animals.",
  "Leaving my dog with this renter was like a home away from home. I'm grateful for their dedication and care.",
  "I couldn't be happier with the service provided by this dog renter. I received regular updates and felt at ease during my trip.",
  "My dog is usually anxious around new people, but this renter's calm and friendly approach made all the difference.",
  "I highly recommend this dog renter to anyone who wants their furry friend to have a great time while they're away.",
  "It's evident that this renter is experienced with dogs. My pup had a blast and came back better behaved!",
  "Choosing this renter was the best decision I made for my dog's care. They went above and beyond to make my dog comfortable.",
  "I appreciated the effort this dog renter put into accommodating my dog's special needs. A compassionate and responsible choice.",
  "My dog's tail starts wagging the moment we arrive at this renter's place. Clearly, a favorite destination for my furry companion.",
]

User.all.each do |user|
  rand(1..6).times do
    Review.create(
      rating: rand(3..5),
      content: content_examples.sample,
      renter: user,
      owner: User.where.not(id: user).sample
    )
  end
end
