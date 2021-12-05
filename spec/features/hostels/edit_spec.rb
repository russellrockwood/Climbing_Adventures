require 'rails_helper'

RSpec.describe 'Hostels edit page', type: :feature do
  before(:each) do
    @city1 = City.create(
      name: 'Townsville',
      travel_advisory: true,
      population: 50)
    @hostel1 = Hostel.create(
      name: 'Big Hostel',
      vacancies: true,
      max_occupancy: 15,
      city_id: @city1.id)
  end


end
