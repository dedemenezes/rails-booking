# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
2.times do |i|
  user = User.create!(email: "user_#{i}@email.com", password: 123456)
  2.times do |x|
    Flat.create! user: user, name: "Flat_#{x}"
  end
end
