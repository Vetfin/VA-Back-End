class SearchesController < ApplicationController

  def create
    @search = Search.create(search_params)
  end

  private def search_params
    params.require(:search).permit(:zipcode, :city, :min_price, :max_price, :min_feet, :max_feet, :min_bed, :max_bed, :min_bath, :max_bath, :parking, :min_hoa, :max_hoa)
  end



end
