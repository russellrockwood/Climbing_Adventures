class CitiesController < ApplicationController
  def index
    @cities = City.all.order('created_at DESC')
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
