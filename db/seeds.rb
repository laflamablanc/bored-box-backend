require 'rest-client'

games = RestClient.get('https://api.boardgameatlas.com/api/search?client_id=Af1TZudirh')

games_array = JSON.parse(games)["games"]

User.create(username: 'Sean', password: "1234", subscribed: false)

Box.create(user_id: 1)

BoxGame.create(box_id: 1, game_id: 1)

UserLike.create(user_id: 1, game_id: 1)

UserGame.create(user_id: 1, game_id: 1)

games_array.each do |game|
  Game.create(
    name: game['name'],
    image: game['image_url'],
    price: game['price'],
    players: games['min_players']
  )
end
