class Api::V1::UsersController < ApplicationController

  skip_before_action :authorized, only: [:create]

    def index
      users = User.all
      render json: users
    end
    
      def create
        # byebug
        user = User.create(user_params)
        if user.valid?
          render json: { user: UserSerializer.new(user)}, status: :created
        else
          render json: { error: 'failed to create user'}, status: :not_acceptable
        end
    end
    
    def show
      user = User.find(params[:id])
      render json: user
    end
    
      private
    
    def user_params
      params.require(:user).permit(:username, :email, :password, :name, :zip, :address, :subscribed,
        :board_score, :card_score, :party_score, :fantasy_score, :economic_score, :territory_score, :players_score,
        boxes_attributes: [:id, games_attributes: %i[id name price]])
    end
end
