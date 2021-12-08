class HostelsController < ApplicationController

  def index
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

  def destroy
    Hostel.destroy(params[:id])
    redirect_to '/hostels'
  end

end
