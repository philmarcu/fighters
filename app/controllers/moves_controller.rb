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
end