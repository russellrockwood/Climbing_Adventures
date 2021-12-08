class ClimbsController < ApplicationController
  def index
    @climbs = Climb.climbs_true
  end

  def show
    @climb = Climb.find(params[:id])
  end

  def edit
    @climb = Climb.find(params[:id])
  end

  def update
    @id = params[:id]
    climb = Climb.find(params[:id])
    climb.update(climb_params)
    redirect_to "/climbs/#{@id}"
  end

  def destroy
    climb = Climb.find(params[:id])
    climb.destroy
    redirect_to '/climbs'
  end

  private

  def climb_params
    params.permit(:name, :sport_or_trad, :yds_difficulty, :number_of_pitches, :number_of_draws, :dangerous_falls, :area_id)
  end

end
