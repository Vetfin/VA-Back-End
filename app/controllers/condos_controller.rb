class CondosController < ApplicationController
  def index
    @condos = Condo.all
  end

  def search
    @condos = Condo.where("status = ? AND price <? AND price >? AND beds < ? AND beds > ? AND baths < ? AND baths > ?", "For Sale", params[:max_price], params[:min_price], params[:max_bed], params[:min_bed], params[:max_bath], params[:min_bath])
    render :index
  end

  private def search_params
    params.require(:condo).permit(:zipcode, :city, :min_price, :max_price, :min_feet, :max_feet, :min_bed, :max_bed, :min_bath, :max_bath, :parking, :min_hoa, :max_hoa)
  end

end
