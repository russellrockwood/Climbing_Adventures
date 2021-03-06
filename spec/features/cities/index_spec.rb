require 'rails_helper'

RSpec.describe 'Cities index page', type: :feature do
  before(:each) do
    @city1 = City.create(
      name: 'Townsville',
      travel_advisory: false,
      population: 50)
    @city2 = City.create(
      name: 'Cityborro',
      travel_advisory: true,
      population: 880)
  end
  it 'can see all cities and dates added' do
    visit '/cities'

    expect(page).to have_content(@city1.name)
    expect(page).to have_content(@city1.created_at)
    expect(page).to have_content(@city2.name)
    expect(page).to have_content(@city2.created_at)
  end

  it 'has link to hostels index' do
    visit '/cities'

    expect(page).to have_link('Hostels', :href=>'/hostels')
  end

  it 'has link to add new city' do
    visit '/cities'

    expect(page).to have_link('New City', :href=>'/cities/new')
  end

  it 'has link to update city' do
    visit '/cities'

    expect(page).to have_link('Update', :href=>"/cities/#{@city1.id}/edit")
  end

  it 'deletes city' do
    visit '/cities'
    click_button("delete", :match => :first)

    expect(page).to have_no_content('Cityborro')
  end
end
