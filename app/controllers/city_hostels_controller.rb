class CityHostelsController < ApplicationController

  def index
    @city = City.find(params[:city_id])
    @hostels = @city.hostels
  end
end
