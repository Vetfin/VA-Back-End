class CondosController < ApplicationController
  def index
    VaScrape.new
    @condos = Condo.all
  end
end
