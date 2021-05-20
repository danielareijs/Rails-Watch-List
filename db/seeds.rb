# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb
require 'faker'

10.times do
  Movie.create(
    title: Faker::Movie.title,
    overview: Faker::Lorem.sentence(word_count: 3),
    poster_url: Faker::Placeholdit.image(size: '50x50'),
    rating: rand(0..1)
    )
end
