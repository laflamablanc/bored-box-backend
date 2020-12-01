require 'rest-client'
require_relative 'games_array.rb'

games_array = get_games

games = RestClient.get('https://api.boardgameatlas.com/api/search?client_id=Af1TZudirh')

# games_array = JSON.parse(games)["games"]

User.create(
  username: 'Sean',
  password: "1234",
  address: "41 Mawhinney Ave, Hawthorne, NJ 07506",
  subscribed: false,
  board_score: 5,
  fantasy_score: 7,
  players_score: 3
)

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
  )
end

BoxGame.create(box_id: 1, game_id: 1, rating: 3)
BoxGame.create(box_id: 1, game_id: 5, rating: 4)
BoxGame.create(box_id: 1, game_id: 3, rating: 5)

UserLike.create(user_id: 1, game_id: 12)
UserLike.create(user_id: 1, game_id: 13)

UserGame.create(user_id: 1, game_id: 7, rating: 0)
UserGame.create(user_id: 1, game_id: 8, rating: 0)
UserGame.create(user_id: 1, game_id: 9, rating: 0)
