# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(username: "geralt", password: "zaraza")

board1 = Board.create!(name: "Sample board", is_public: "true", user_id: user.id)
board1 = Board.create!(name: "Another sample board", is_public: "false", user_id: user.id)

archived1 = Board.create!(name:"Sample archived board (private)", is_public: "false", user_id: user.id, archiving_date: DateTime.strptime("15-09-2020", '%d-%m-%Y'))
archived2 = Board.create!(name:"Sample archived board (public)", is_public: "true", user_id: user.id, archiving_date: DateTime.strptime("24-06-1998", '%d-%m-%Y'))