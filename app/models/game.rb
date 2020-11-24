class Game < ApplicationRecord
  has_many :box_games
  has_many :boxes, through: :box_games
  has_many :user_games
  has_many :users, through: :user_games

  #needs self join
end
