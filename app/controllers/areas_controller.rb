class AreasController < ApplicationController
  def index
    @areas = Area.areas_desc
  end

  def new
  end

  def show
    @area = Area.find(params[:id])
  end

  def create
    area = Area.create(area_params)
    redirect_to '/areas'
  end

  def edit
    @area = Area.find(params[:id])
  end

  def update
    area = Area.find(params[:id])
    area.update(area_params)
    redirect_to '/areas'
  end

  def destroy
    area = Area.find(params[:id])
    area.destroy
    redirect_to '/areas'
  end

private
  def area_params
    params.permit(:name, :nearest_city, :state, :has_free_camping, :cost_for_paid_camping, :rock_type)
  end
end
