class AreaClimbsController < ApplicationController
  def index
    #binding.pry
    # @area = Area.find(params[:area_id])
    # @climbs = @area.climbs

    # if params[:order] == 'name'
    #   # binding.pry
    #   @climbs = Climb.climbs_alphabetical
    # else
    #   @area = Area.find(params[:area_id])
    #   @climbs = @area.climbs
    # end
    # binding.pry

    @area = Area.find(params[:area_id])
    if params[:min_pitches]
      @climbs = @area.climbs.min_pitch(params[:min_pitches])
      # redirect_to "/areas/#{@area_id}/climbs"
    else
      @climbs = @area.climbs
    end
  end

  def new
    @area_id = params[:area_id]
  end

  def show
    @climb = Climb.find(params[:id])
  end

  def create
    @area_id = params[:area_id]
    climb = Climb.create(climb_params)
    redirect_to "/areas/#{@area_id}/climbs"
  end

  private

  def climb_params
    params.permit(:name, :sport_or_trad, :yds_difficulty, :number_of_pitches, :number_of_draws, :dangerous_falls, :area_id)
  end

end
