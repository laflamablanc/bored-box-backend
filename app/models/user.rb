class User < ApplicationRecord
  has_many :boxes
  has_many :user_games
  has_many :games, through: :user_games
  accepts_nested_attributes_for :boxes, allow_destroy: true

  def boxgames
    current_box = self.boxes[-1]
    return current_box.games
  end

  def collection
    self.games
  end

  def create_user_profile
    #Create vector that represents user profile
  end

  def update_user_profile
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
  end

  def similarity_score(game)
    # create a vector for the user the method is being called on
    # attributes needed are board_score, fantasy_score, players_score
    user_vector = Vector[self.board_score, self.fantasy_score, self.players_score]
    #next, create a vector for the game being passed in to the method
    #we will then compare the two vectors to see how similar the games are
    game_vector = Vector[game.board_score, game.fantasy_score, game.players_score]
    #now that we have 2 vectors we will find the similarity by putting the dot product
    #in our numberator, and the product of each vectors magnitude in our denominator
    numerator = vector_a.inner_product(vector_b)
    denominator = vector_a.r * vector_b.r
    #this will give the cosine similarity
    score = numerator/denominator*100
    return score.to_i
  end


end
