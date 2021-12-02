require 'rails_helper'

RSpec.describe 'Cities index page', type: :feature do
  it 'can see all cities and dates added' do
    city1 = City.create(
      name: 'Townsville',
      travel_advisory: false,
      population: 50)
    city2 = City.create(
      name: 'Cityborro',
      travel_advisory: true,
      population: 880)

    visit '/cities'

    expect(page).to have_content(city1.name)
    expect(page).to have_content(city1.created_at)
    expect(page).to have_content(city2.name)
    expect(page).to have_content(city2.created_at)
  end
end
