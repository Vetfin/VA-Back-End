class CondosController < ApplicationController
  def index
    @condos = Condo.all
  end

  def search
    # @condos = Condo.where("price < ? AND price > ? AND beds < ? AND beds > ? AND baths < ? AND baths > ?", params[:max_price], params[:min_price], params[:max_bed], params[:min_bed], params[:max_bath], params[:min_bath])
    @condos = Condo.where(status: "For Sale")
    @condos = @condos.where("price >= ?", params[:min_price]) if params[:min_price]
    @condos = @condos.where("price <= ?", params[:max_price]) if params[:max_price]
    @condos = @condos.where("baths >= ?", params[:min_bath]) if params[:min_bath]
    @condos = @condos.where("baths <= ?", params[:max_bath]) if params[:max_bath]
    @condos = @condos.where("beds >= ?", params[:min_bed]) if params[:min_bed]
    @condos = @condos.where("beds <= ?", params[:max_bed]) if params[:max_bed]

    render :index
  end

  def favorite
    @user = current_user
    if @user
      @condo = Condo.find(params[:id])
      @user.condos << @condo
      render '/users/show.json.jbuilder'
    else
      render json: {}, message: "No user matches that token"
    end
  end

  def show
    @condo = Condo.find(params[:id])
  end
end
