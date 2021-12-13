# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

25.times do
    Game.create(
        name: Faker::Game.title,
        price: 100,
        creator: Faker::Name.name,
        editor: Faker::TvShows::Stargate.planet,
        description: Faker::Lorem.question(word_count: 24),
        min_player: rand(1..4),
        max_player: rand(4..20),
        min_age: rand(4..18),
        release_date: Faker::Date.in_date_period(year: rand(1995..2021)),
        sell_stock: rand(1..20),
        rent_stock: rand(1..20)
        )
    puts 'Game crée'
end

Package.create(
    game_number:1,
    name:"Débutant",
    price: 1000
    )
puts 'Package crée'

Package.create(
    game_number:2,
    name:"Habitué",
    price: 1500
    )
puts 'Package crée'

Package.create(
    game_number:4,
    name:"Exper",
    price: 2000
    )
puts 'Package crée'

10.times do
    Tag.create(
        name: Faker::Lorem.characters(number: rand(1..15))
        )
    puts 'Tag crée'
end

10.times do 
    JoinGameAndTag.create(
        game_id: rand(1..25),
        tag_id: rand(1..10)
        )
    puts 'JoinGameAndTag crée'
end

User.create(
    first_name: Faker::Internet.username ,
    last_name: Faker::Internet.username,
    email: "admin@playbox.thp",
    password:"123456",
    address:((rand(200)).to_s + " grande rue " + (Faker::Address.zip).to_s + " " + (Faker::Address.city) ),
    phone: "0" + rand(100000000..999999999).to_s,
    admin: true,
    subscription_ending: Faker::Date.in_date_period(year: 2022, month: rand(1..12)),
    package_id: 1
    )
puts "Admin crée"

5.times do
    User.create(
        first_name: Faker::Internet.username ,
        last_name: Faker::Internet.username,
        email: Faker::Internet.email,
        password: "123456",
        address: ((rand(200)).to_s + " grande rue " + (Faker::Address.zip).to_s + " " + (Faker::Address.city) ),
        phone: "0" + rand(100000000..999999999).to_s,
        admin: false,
        # subscription_ending: Faker::Date.in_date_period(year: 2022, month: rand(1..12)),
        package_id:1
        )
    puts 'User crée'
end

5.times do 
    Rent.create(
        game_id: rand(1..25),
        user_id: rand(1..6),
        quantity: rand(1..3),
        status: 1
    )
    puts 'Rent crée'
end

10.times do 
    Rank.create(
        game_id: rand(1..25),
        user_id: rand(1..6),
        note: rand(1..5),
    )
    puts 'Rank crée'
end

15.times do 
    Comment.create(
        game_id: rand(1..25),
        user_id: rand(1..6),
        content: Faker::Lorem.paragraph(sentence_count: rand(1..5)),
    )
    puts 'Comment crée'
end

5.times do 
    Favorite.create(
        game_id: rand(1..25),
        user_id: rand(1..6),
    )
    puts 'Favorite crée'
end

=begin
 10.times do 
    Cart.create(
        user_id: rand(1..6),
        paid: [true, false].sample,
        stripe_customer_id: rand(100000..999999).to_s
    )
    puts 'Cart crée'
end 
=end

10.times do 
    Order.create(
        game_id: rand(1..25),
        cart_id: rand(1..10),
        quantity: rand(1..3)
    )
    puts 'Order crée'
end

30.times do
    Image.create(
        game_id: rand(1..25),
        public_id:'https://cdn.w600.comps.canstockphoto.fr/jeu-table-diamant-three-player-image_csp68281811.jpg'
        )
    puts 'Image créee'
end

