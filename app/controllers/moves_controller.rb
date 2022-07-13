class MovesController < ApplicationController

  def index
    @moves = Move.all
  end

  def best
    @moves = Move.order_by_top_tier
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

  def destroy
    move = Move.find(params[:id])
    move.destroy
    redirect_to '/moves'
  end

  private
  def move_params
    params.permit(:name, :power, :speed, :grade, :top_tier)
  end

end