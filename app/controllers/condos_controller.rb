class CondosController < ApplicationController
  def index
    @condos = Condo.all
  end

  def search
    @condos = Condo.where("status =? AND price <? AND price >? AND beds <? AND beds >? AND baths <? AND baths >?", "For Sale", params[:max_price], params[:min_price], params[:max_bed], params[:min_bed], params[:max_bath], params[:min_bath])
    render :index
  end

  def show
    @condo = Condo.find(params[:id])
  end


end
