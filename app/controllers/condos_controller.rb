class CondosController < ApplicationController
  def index
    @condos = Condo.all
  end

  def search
    @condos = Condo.where("price <? AND price >?", params[:max_price], params[:min_price])
    render :index
  end

  private def search_params
    params.require(:condo).permit(:zipcode, :city, :min_price, :max_price, :min_feet, :max_feet, :min_bed, :max_bed, :min_bath, :max_bath, :parking, :min_hoa, :max_hoa)
  end

end
