require 'matrix'

class Game < ApplicationRecord
  has_many :box_games
  has_many :boxes, through: :box_games
  has_many :user_games
  has_many :users, through: :user_games




  def similarity_score_game(game)
    # create a vector for the game method is being called on
    # attributes needed are board_score, fantasy_score, players_score
    vector_a = Vector[self.board_score, self.card_score, self.party_score, self.players_score]
    #next, create a vector for the game being passed in to the method
    #we will then compare the two vectors to see how similar the games are
    vector_b = Vector[game.board_score, game.card_score, game.party_score, game.players_score]
    #now that we have 2 vectors we will find the similarity by putting the dot product
    #in our numerator, and the product of each vectors magnitude in our denominator
    numerator = vector_a.inner_product(vector_b)
    denominator = vector_a.r * vector_b.r
    #this will give the cosine similarity
    score = numerator/denominator*100
    return score.to_i
  end

  def similarity_score_user(user)
    # create a vector for the game method is being called on
    # attributes needed are board_score, fantasy_score, players_score
    vector_a = Vector[user.board_score, self.card_score, self.party_score, self.fantasy_score, self.economic_score, self.territory_score, self.players_score ]
    #next, create a vector for the game being passed in to the method
    #we will then compare the two vectors to see how similar the games are
    vector_b = Vector[self.board_score, user.card_score, user.party_score, user.fantasy_score, user.economic_score, user.territory_score, user.players_score ]
    #now that we have 2 vectors we will find the similarity by putting the dot product
    #in our numerator, and the product of each vectors magnitude in our denominator
    numerator = vector_a.inner_product(vector_b)
    denominator = vector_a.r * vector_b.r
    #this will give the cosine similarity
    score = numerator/denominator*100
    return score.to_i
  end




end
