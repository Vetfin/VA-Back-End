class CondosController < ApplicationController
  def index
    # Condo.destroy_all
    VaScrape.new
    @condos = Condo.all
  end
end
