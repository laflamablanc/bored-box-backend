class Box < ApplicationRecord
  has_many :box_games
  has_many :games, through: :box_games
  belongs_to :user
end
