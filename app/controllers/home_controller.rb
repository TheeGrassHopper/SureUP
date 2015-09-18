class HomeController < ApplicationController

  def index
    @types = ["NEW", "USED", "ALL"]
    render json: @types
  end
end

