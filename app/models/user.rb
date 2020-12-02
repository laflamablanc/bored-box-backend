require 'matrix'

class User < ApplicationRecord
  has_many :boxes
  has_many :user_games
  has_many :games, through: :user_games
  accepts_nested_attributes_for :boxes, allow_destroy: true

  attr_accessor :user_profile
  attr_accessor :total_reviews


  def boxgames
    current_box = self.boxes[-1]
    return current_box.games
  end

  def collection
    self.games
  end

  def create_user_profile
    #Create vector that represents user profile
    @total_reviews = 2
    @user_profile = Vector[self.board_score, self.card_score, self.party_score, self.fantasy_score, self.economic_score, self.territory_score, self.players_score]
  end

  def user_profile
    return {
      board_score: self.board_score,
      card_score: self.card_score,
      party_score: self.party_score,
      fantasy_score: self.fantasy_score,
      economic_score: self.economic_score,
      territory_score: self.territory_score,
      players_score: self.players_score
    }
  end

  def update_user_profile(new_rating_vector)
    #mean of user profile and weighted new item review
    # Vold = current user profile
    #Vnew = new user profile after rating is factored in
    #Vitem = vector representation of item being review
    #If the review is favorable, use it to calculate new mean
    #If review was negative, use the inverse vector to calculate new mean

    #ex - If a user profile consists of 5 reviews, the effect of a 6th would
    #looks like this:

    #(5 x Vold + Vitem)/6
    #formula: Vnew = ((n x Vold) + Vitem )/ n + 1
    new_vector_x = (@total_reviews * @user_profile[0] + new_rating_vector[0])/(@total_reviews + 1)
    new_vector_y = (@total_reviews * @user_profile[1] + new_rating_vector[1])/(@total_reviews + 1)
    new_vector_z = (@total_reviews * @user_profile[2] + new_rating_vector[2])/(@total_reviews + 1)
    @user_profile = Vector[new_vector_x, new_vector_y, new_vector_z]
    @total_reviews += 1
    return @user_profile
  end

  def return_user_profile
    @user_profile
  end

  def similarity_score(game)
    # create a vector for the user the method is being called on
    # attributes needed are board_score, fantasy_score, players_score
    user_vector = @user_profile
    #next, create a vector for the game being passed in to the method
    #we will then compare the two vectors to see how similar the games are

    game_vector = Vector[game.board_score, game.card_score, game.party_score, game.fantasy_score, game.economic_score, game.territory_score, game.players_score ]
    #now that we have 2 vectors we will find the similarity by putting the dot product
    #in our numberator, and the product of each vectors magnitude in our denominator
    numerator = user_vector.inner_product(game_vector)
    denominator = user_vector.r * game_vector.r
    #this will give the cosine similarity
    score = numerator/denominator*100
    return score.to_i
  end

  def game_recs
    game_rec_array = []
    self.create_user_profile
    Game.all.each do |game|
      score = game.similarity_score_user(self)
      game_rec_array.push({game: game, similarity: score})
    end
    ranked = game_rec_array.sort_by{|rec| -rec[:similarity]}
    return ranked
  end


end
