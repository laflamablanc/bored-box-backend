class Game < ApplicationRecord
  has_many :box_games
  has_many :boxes, through: :box_games

  #needs self join
end
