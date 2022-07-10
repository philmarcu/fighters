class FightersController < ApplicationController

  def index
    @fighters = Fighter.all.order_by_created_at
  end

  def show
    @fighter = Fighter.find(params[:id])
  end

  def new
   
  end

  def create
    fighter = Fighter.new({
      name: params[:fighter][:name],
      rival: params[:fighter][:rival],
      rank: params[:fighter][:rank],
      style: params[:fighter][:style]
    })
    fighter.save
    redirect_to '/fighters'
  end
end