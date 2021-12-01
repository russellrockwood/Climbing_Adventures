class AreasController < ApplicationController
  def index
    @areas = ['Area 1', 'Area 2', 'Area 3']
  end

  def new
  end

  def create
    area = Area.new({
      title: params[:area][:title],
      description: params[:area][:description]
      })

      area.save

      redirect_to '/areas'
  end
end
