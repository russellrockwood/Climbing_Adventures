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

  it 'has link to hostels index' do
    visit '/cities'

    expect(page).to have_link('Hostels', :href=>'/hostels')
  end

  it 'has link to add new city' do
    visit '/cities'

    expect(page).to have_link('Add City', :href=>'/cities/new')
  end

  it 'has link to update city' do
    city1 = City.create(
      name: 'Townsville',
      travel_advisory: false,
      population: 50)

    visit '/cities'

    expect(page).to have_link('Update', :href=>"/cities/#{city1.id}/edit")
  end
end
