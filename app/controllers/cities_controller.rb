class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
  end

  def show
    @city = City.find(params[:id])
  end
end
