# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Toilet.destroy_all

puts "Creating toilets..."
10.times do
  toilet = Toilet.new(
    name:    Faker::Company.name,
    description:  Faker::Lorem.sentence,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}"
  )
  toilet.save!
end
puts "Finished!"
