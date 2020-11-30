class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :password, :address, :boxes, :subscribed, :collection, :user_games, :create_user_profile

  # :board_score, :fantasy_score, :players_score,

  def boxes
    ActiveModel::SerializableResource.new(object.boxes, each_serializer: BoxSerializer)
  end

end
