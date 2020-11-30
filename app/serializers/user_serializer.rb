class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :password, :address, :boxes, :subscribed, :collection, :user_games

  def boxes
    ActiveModel::SerializableResource.new(object.boxes, each_serializer: BoxSerializer)
  end

end
