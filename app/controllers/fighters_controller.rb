class FightersController < ApplicationController

  def index
    @fighters = Fighter.all.order_by_created_at
  end

  def show
    @fighter = Fighter.find(params[:id])
  end
end