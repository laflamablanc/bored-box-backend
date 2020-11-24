class User < ApplicationRecord
  has_many :boxes
  has_many :user_games
  has_many :games, through: :user_games
end
