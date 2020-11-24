class User < ApplicationRecord
  has_many :boxes
  has_many :user_games
  has_many :games, through: :user_games

  def boxgames
    current_box = self.boxes[-1]
    return current_box.games
  end

end
