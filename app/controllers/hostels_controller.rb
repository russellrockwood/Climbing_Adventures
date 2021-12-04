class HostelsController < ApplicationController

  def index
    @hostels = Hostel.all
  end

  def show
    @hostel = Hostel.find(params[:id])
  end

  def new

  end

  def create
    binding.pry
    # hostel = Hostel.new({
    #   name: params[:hostel][:name],
    #   vacancies: params[:hostel][:vacancies] == 'on' ? true : false,
    #   max_occupancy: params[:hostel][:max_occupancy],
    #   city_id:
    #   })

    # hostel.save
    # redirect_to '/cities/'
  end
end
