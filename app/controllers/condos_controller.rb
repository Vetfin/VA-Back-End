class CondosController < ApplicationController
  def index
    @condos = Condo.all
  end

end
