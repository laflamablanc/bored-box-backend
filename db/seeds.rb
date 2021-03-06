require 'rest-client'
require_relative 'games_array.rb'

games_array = get_games

games = RestClient.get('https://api.boardgameatlas.com/api/search?client_id=Af1TZudirh')

User.create(
  username: 'Sean',
  password_digest: BCrypt::Password.create('1234'),
  address: "41 Mawhinney Ave, Hawthorne, NJ 07506",
  zip: "07506",
  subscribed: false,
  board_score: 5,
  card_score: 6,
  party_score: 3,
  fantasy_score: 7,
  economic_score: 7,
  territory_score: 9,
  players_score: 3,
)

User.create(
  username: 'Test',
  password_digest: BCrypt::Password.create('test123'),
  address: "Mulberry St",
  zip: "12345",
  subscribed: false,
  board_score: 5,
  card_score: 6,
  party_score: 3,
  fantasy_score: 7,
  economic_score: 7,
  territory_score: 9,
  players_score: 3,
)

Box.create(user_id: 1)
Box.create(user_id: 1)

genres = ["Card", "Party", "Fantasy", "Sci-Fi", "Strategy", "Econonmic"]
companies = ["Pandasaurus Games", "Hasbro", "FunTime Gaming", "Gamers Unite", "Hello! Games", "Ambassador Games", "ALterego Games", "Alien Game Co", "Artana", "Badger's Nest", "Kraken Games", ]

games_array.each do |game|
  Game.create(
    name: game[:name],
    image: game[:image],
    price: game[:price],
    max_players: game[:max_players],
    min_players: game[:min_players],
    play_time: game[:play_time],
    description: game[:description],
    genre: game[:genre],
    rating: game[:rating],
    company: companies[rand(15)],
    rank: game[:rank],
    board_score: game[:board_score],
    fantasy_score: game[:fantasy_score],
    players_score: game[:players_score],
    card_score: rand(10),
    party_score: rand(10),
    territory_score: rand(10),
    economic_score: rand(10),
  )
end

BoxGame.create(box_id: 2, game_id: 1, rating: 3)
BoxGame.create(box_id: 2, game_id: 5, rating: 4)
BoxGame.create(box_id: 2, game_id: 3, rating: 5)

BoxGame.create(box_id: 1, game_id: 12, rating: 3)
BoxGame.create(box_id: 1, game_id: 14, rating: 4)
BoxGame.create(box_id: 1, game_id: 18, rating: 5)

UserLike.create(user_id: 1, game_id: 12)
UserLike.create(user_id: 1, game_id: 13)

UserGame.create(user_id: 1, game_id: 7, rating: 0)
UserGame.create(user_id: 1, game_id: 8, rating: 0)
UserGame.create(user_id: 1, game_id: 9, rating: 0)
