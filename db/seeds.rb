# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(username: "geralt", password: "zaraza")

board1 = Board.create!(name: "Sample board", is_public: "true", user_id: user.id)
board2 = Board.create!(name: "Another sample board", is_public: "false", user_id: user.id)

archived1 = Board.create!(name:"Sample archived board (private)", is_public: "false", user_id: user.id, archiving_date: DateTime.strptime("15-09-2020", '%d-%m-%Y'))
archived2 = Board.create!(name:"Sample archived board (public)", is_public: "true", user_id: user.id, archiving_date: DateTime.strptime("24-06-1998", '%d-%m-%Y'))

list_board1 = List.create!(name: "Test list 1", board_id: board1.id)
list_board2 = List.create!(name: "test list 2", board_id: board2.id)

archivedboard_list1 = List.create!(name: "archived1", board_id: archived1.id)
archivedboard_list2 = List.create!(name: "archived2", board_id: archived2.id)

card1 = Card.create!(name: "Test card 1", list_id: list_board1.id)
card2 = Card.create!(name: "Test card 2", list_id: list_board2.id)
card3 = Card.create!(name: "Test archived card 1", list_id: archivedboard_list1.id)
card4 = Card.create!(name: "Test archived card 2", list_id: archivedboard_list2.id)

#comments
comment1 = CardComment.create!(content: "my first comment ever, yay", card_id: card1.id, user_id: user.id)
comment2 = CardComment.create!(content: "I'm blue Da ba dee da ba di", card_id: card1.id, user_id: user.id)
comment3 = CardComment.create!(content: "Eh, its just a fleshwound.", card_id: card2.id, user_id: user.id)
comment4 = CardComment.create!(content: "A jak pan jezus powiedział?", card_id: card2.id, user_id: user.id)
comment5 = CardComment.create!(content: "Tak jak pan jezus powiedział", card_id: card3.id, user_id: user.id)
comment6 = CardComment.create!(content: "No jak mi dają to jem", card_id: card3.id, user_id: user.id)
comment7 = CardComment.create!(content: "Ravioli ravioli give me the death I deservioli", card_id: card4.id, user_id: user.id)
comment8 = CardComment.create!(content: "How do you do fellow kids?", card_id: card4.id, user_id: user.id)