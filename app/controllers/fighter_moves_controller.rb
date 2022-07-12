class FighterMovesController < ApplicationController

  def index
    @fighter = Fighter.find(params[:fighter_id])
    @moves = @fighter.moves
    if params[:sort] == 'name'
      @moves = @fighter.moves.by_name
    else
      @moves = @fighter.moves
    end
  end

  def new
    @fighter = Fighter.find(params[:fighter_id])
  end
  
  def create
    fighter = Fighter.find(params[:fighter_id])
    fighter.moves.create!(move_params)
    redirect_to "/fighters/#{fighter.id}/moves"
  end

  private
  def move_params
    params.permit(:name, :power, :speed, :grade, :top_tier)
  end


  # destroy method notes
  # have to look up the variable id again

end
