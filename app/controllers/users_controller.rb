class UsersController < ApplicationController
  def index
    users = User.all
    render json: users
  end

  def create
    user = User.create(user_params)
    render json: user
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :name, :zip, :address, :subscribed,
      :board_score, :card_score, :party_score, :fantasy_score, :economic_score, :territory_score, :players_score,
      boxes_attributes: [:id, games_attributes: %i[id name price]])
  end

end
