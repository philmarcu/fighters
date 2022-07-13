class FightersController < ApplicationController

  def index
    @fighters = Fighter.all.order_by_created_at
  end
  
  def new
  end

  def show
    @fighter = Fighter.find(params[:id])
  end

  def create
    fighter = Fighter.create!(fighter_params)
    redirect_to '/fighters'
  end
    

  def edit
    @fighter = Fighter.find(params[:id])
  end

  def update
    fighter =Fighter.find(params[:id])
    fighter.update!(fighter_params)
    redirect_to "/fighters/#{fighter.id}"
  end

  def destroy
    fighter = Fighter.find(params[:id])
    fighter.destroy
    redirect_to '/fighters'
  end

  private
  def fighter_params
    params.permit(:name, :rival, :rank, :style)
  end
end