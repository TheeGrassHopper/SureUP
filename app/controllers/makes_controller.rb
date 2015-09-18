class MakesController < ApplicationController

  def index
    if session[:condition] == "ALL"
      @makes = Edmunds::Make.new.find_all
      render json: @makes
    elsif session[:condition] == "USED"
      @makes = Edmunds::Make.new.find_used_makes
      render json: @makes
    else
      @makes = Edmunds::Make.new.find_new_makes
      render json: @makes
    end
  end

  def show
    @make = params[:name]
    render json: @make
    if session[:condition] == "ALL"
      @models = Edmunds::Model.new.find_by_make_id(params[:id])
      render json: @models
    elsif session[:condition] == "USED"
      @models = Edmunds::Model.new.find_used_models_by_make_id(params[:id])
      render json: @models
    else
      @models = Edmunds::Model.new.find_new_models_by_make_id(params[:id])
      
    end
  end

end
