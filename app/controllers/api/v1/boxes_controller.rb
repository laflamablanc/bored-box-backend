class Api::V1::BoxesController < ApplicationController
  def index
    boxes = Box.all
    render json: boxes
  end

  def create
    box = Box.create(box_params)
    render json: box
  end



  private

  def box_params
    params.require(:box).permit(:user_id)
  end

end
