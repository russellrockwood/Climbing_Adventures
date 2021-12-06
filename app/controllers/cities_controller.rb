class CitiesController < ApplicationController
  def index
    @cities = City.cities_desc
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

  def edit
    @city = City.find(params[:id])
  end

  def update
    city = City.find(params[:id])
    city.update({
      name: params[:city][:name],
      travel_advisory: params[:city][:travel_advisory] == 'on' ? true : false,
      population: params[:city][:population]
      })

    city.save
    redirect_to "/cities/#{city.id}"
  end

  def city_hostels
    @city = City.find(params[:id])
    @hostels = @city.hostels
  end

  def destroy
    City.destroy(params[:id])
    redirect_to '/cities'
  end
end
