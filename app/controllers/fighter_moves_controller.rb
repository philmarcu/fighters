class FighterMovesController < ApplicationController

  def index
    @fighter = Fighter.find(params[:fighter_id])
    @moves = @fighter.moves
  end
end
