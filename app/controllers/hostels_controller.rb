class HostelsController < ApplicationController

  def index
    # if params[:order] == 'name'
    #   return @hostels = Hostel.hostels_with_vacancies.alphabetical
    # end
    @hostels = Hostel.hostels_with_vacancies
  end

  def show
    @hostel = Hostel.find(params[:id])
  end

  def edit
    @hostel = Hostel.find(params[:id])
  end

  def update
    hostel = Hostel.find(params[:id])
    hostel.update({
      name: params[:name],
      vacancies: params[:vacancies] == '1' ? true : false,
      max_occupancy: params[:max_occupancy],
      city_id: params[:city_id]
      })

      hostel.save
      redirect_to "/hostels/#{hostel.id}"
  end

end
