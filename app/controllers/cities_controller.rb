class CitiesController < ApplicationController
  def index
    @cities = City.cities_asc
  end

  def new
  end

  def create
    city = City.new({
      name: params[:city][:name],
      travel_advisory: params[:city][:travel_advisory],
      population: params[:city][:population]
      })

    city.save
    redirect_to '/cities'
  end

  def show
    @city = City.find(params[:id])
  end

  def city_hostels
    @city = City.find(params[:id])
    @hostels = @city.hostels
  end
end
