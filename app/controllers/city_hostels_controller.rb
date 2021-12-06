class CityHostelsController < ApplicationController

  def index
    @city = City.find(params[:city_id])
    # binding.pry
    if params[:order] == 'name'
      @hostels = @city.hostels.alphabetical
    else
      @hostels = @city.hostels
    end
  end

  def new
    @city_id = params[:city_id]
  end

  def create
    hostel = Hostel.new({
      name: params[:hostel][:name],
      vacancies: params[:hostel][:vacancies] == 'on' ? true : false,
      max_occupancy: params[:hostel][:max_occupancy],
      city_id: params[:hostel][:city_id]
      })

    hostel.save
    redirect_to "/cities/#{hostel.city_id}/hostels"
  end
end
