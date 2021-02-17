class Api::V1::UserGamesController < ApplicationController
  def index
    user_games = UserGame.all
    render json: user_games
  end

  def create
    user_game = UserGame.create(user_game_params)
    render json: user_game
  end

  def show
    user_game = UserGame.find(params[:id])
    render json: user_game
  end

  def update
    user_game = UserGame.find(params[:id])
    user_game.update!(user_game_params)
    render json: user_game
  end

  def destroy
    @user_game = UserGame.find(params[:id])
    @user_game.destroy
    render json: {}
  end

  private

  def user_game_params
    params.require(:user_game).permit(:user_id, :game_id, :rating)
  end

end
