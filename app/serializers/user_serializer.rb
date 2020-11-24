class UserSerializer < ActiveModel::Serializer

  attributes :id, :username, :password, :address, :boxes, :subscribed, :games, :boxgames
end
