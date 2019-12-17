# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

steve = User.create(username: "sd", email:"s@mail.com", password:"1234")
khris = User.create(username: "kp", email:"k@mail.com", password:"abcd")
boris = User.create(username: "bd", email:"b@mail.com", password:"0000")

10.times do
    Location.create([{
        city: Faker::Address.city,
        state: Faker::Address.state,
    }])
end

adv_type = ["Hiking", "Camping", "Stargazing", "Walking", "Trail Running", "Surfing", "Golfing", "Fishing"]
adv_type.each do |activity|
    Category.create(adv_type: activity)
end

redrock = Adventure.create( 
    name: "Red Rock!!!" , 
    recommendation: "Ice Box Canyon has a great waterfall!",
    user_id: steve.id,
    location_id: 1,
    category_id: 1)

grandcanyon = Adventure.create( 
    name: "Super Awesome" , 
    recommendation: "must have 4x4, bring sunscreen",
    user_id: steve.id,
    location_id: 2,
    category_id: 2)

