class CitiesController < ApplicationController
  def index
    @cities = City.cities_desc
  end

  def new
  end

  def create
    city = City.new({
      name: params[:name],
      travel_advisory: params[:travel_advisory],
      population: params[:population]
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
      name: params[:name],
      travel_advisory: params[:travel_advisory],
      population: params[:population]
      })

    city.save
    redirect_to "/cities/#{city.id}"
  end

  def destroy
    City.destroy(params[:id])
    redirect_to '/cities'
  end
end
