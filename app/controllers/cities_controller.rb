class CitiesController < ApplicationController
  def index
    @cities = City.all
  end

  # def new
  # end
end
