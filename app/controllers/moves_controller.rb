class MovesController < ApplicationController

  def index
    @moves = Move.all
  end

  def show
    @move = Move.find(params[:id])
  end

  def new
  end

  def edit
    @move = Move.find(params[:id])
  end

  def update
    move = Move.find(params[:id])
    move.update!(move_params)
    redirect_to "/moves/#{move.id}"
  end

  private
  def move_params
    params.permit(:name, :power, :speed, :grade, :top_tier)
  end

end