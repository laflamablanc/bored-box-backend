require 'rest-client'

games = RestClient.get('https://api.boardgameatlas.com/api/search?client_id=Af1TZudirh')

games_array = JSON.parse(games)["games"]

User.create(username: 'Sean', password: "1234", address: "41 Mawhinney Ave, Hawthorne, NJ 07506", subscribed: false)

Box.create(user_id: 1)

games_array.each do |game|
  Game.create(
    name: game['name'],
    image: game['image_url'],
    price: game['price'],
    players: game['max_players'],
    rating: game['average_user_rating'],
    rank: game['rank']
  )
end

BoxGame.create(box_id: 1, game_id: 1)
BoxGame.create(box_id: 1, game_id: 5)
BoxGame.create(box_id: 1, game_id: 3)

UserLike.create(user_id: 1, game_id: 12)
UserLike.create(user_id: 1, game_id: 13)

UserGame.create(user_id: 1, game_id: 7)
UserGame.create(user_id: 1, game_id: 8)
UserGame.create(user_id: 1, game_id: 9)
