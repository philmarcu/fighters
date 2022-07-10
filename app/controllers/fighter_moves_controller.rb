class FighterMovesController < ApplicationController

  def index
    @fighter = Fighter.find(params[:id])
    @moves = @fighter.moves
  end

  def new
    
  end

  def create
    @fighter = Fighter.find(params[:id])
    move = Move.new({
      name: params[:move][:name],
      name: params[:move][:power],
      name: params[:move][:speed],
      name: params[:move][:grade],
      name: params[:move][:top_tier]
    })
    move.save
    redirect_to "/fighters/#{@fighter.id}/moves"
  end
end
