class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :address, :boxes, :subscribed, :collection, :user_games, :user_profile, :game_recs

  # :board_score, :fantasy_score, :players_score,

  def boxes
    ActiveModel::SerializableResource.new(object.boxes, each_serializer: BoxSerializer)
  end



end
