class Api::V1::BoxGamesController < ApplicationController

  def index
    box_games = BoxGame.all
    render json: box_games
  end

  def create
    box_game = BoxGame.create(box_game_params)
    render json: box_game
  end


  def destroy
    @box_game = BoxGame.find(params[:id])
    @box_game.destroy
    render json: {}
  end

  private

  def box_game_params
    params.require(:box_game).permit(:box_id, :game_id)
  end

end
