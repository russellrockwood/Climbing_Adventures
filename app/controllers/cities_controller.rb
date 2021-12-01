class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  def new
  end

  def show
    @city = City.find(params[:id])
  end

  def hostels_by_city
    @city = City.find(params[:id])
    @hostels = @city.hostels
  end
end
