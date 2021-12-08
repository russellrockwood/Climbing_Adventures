class AreaClimbsController < ApplicationController
  def index

    @area = Area.find(params[:area_id])
    if params[:order]
      @climbs = @area.climbs.alphabetical
    elsif params[:number_of_pitches]
      @climbs = @area.min_pitch(params[:number_of_pitches])
    else
      @climbs = @area.climbs
    end

  end

  def new
    @area_id = params[:area_id]
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
