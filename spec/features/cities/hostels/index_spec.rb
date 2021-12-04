require "rails_helper"

RSpec.describe 'City hostels index', type: :feature do
  before(:each) do
    @city = City.create(
      name: 'Townsville',
      travel_advisory: false,
      population: 50)
    @hostel = Hostel.create(
      name: 'Cool Hostel',
      vacancies: true,
      max_occupancy: 15,
      city_id: @city.id
    )
  end

  it 'lists hostels in city' do
    visit "/cities/#{@city.id}/hostels"

    expect(page).to have_content(@hostel.name)
    expect(page).to have_content(@hostel.vacancies)
    expect(page).to have_content(@hostel.max_occupancy)
    expect(page).to have_content(@hostel.created_at)
    expect(page).to have_content(@hostel.updated_at)
  end

  it 'has a link to add new hostel to city' do
    visit "/cities/#{@city.id}/hostels"

    expect(page).to have_link('Add Hostel', :href=> "/cities/#{@city.id}/hostels/new")
  end

  it "links to a create new hostel by city page" do
    visit "/cities/#{@city.id}/hostels"

    click_on('Add Hostel')
    expect(current_path).to eq("/cities/#{@city.id}/hostels/new")
  end
end
