require "rails_helper"

RSpec.describe 'City hostels index', type: :feature do
  before(:each) do
    @city = City.create(
      name: 'Townsville',
      travel_advisory: false,
      population: 50)
    @hostel1 = Hostel.create(
      name: 'Cool Hostel',
      vacancies: true,
      max_occupancy: 15,
      city_id: @city.id)
    @hostel2 = Hostel.create(
      name: 'Big Hostel',
      vacancies: true,
      max_occupancy: 25,
      city_id: @city.id)
  end

  it 'lists hostels in city' do
    visit "/cities/#{@city.id}/hostels"

    expect(page).to have_content(@hostel1.name)
    expect(page).to have_content(@hostel1.vacancies)
    expect(page).to have_content(@hostel1.max_occupancy)
    expect(page).to have_content(@hostel1.created_at)
    expect(page).to have_content(@hostel1.updated_at)
  end

  it 'has a link to add new hostel to city' do
    visit "/cities/#{@city.id}/hostels"

    expect(page).to have_link('Add Hostel', :href=> "/cities/#{@city.id}/hostels/new")
  end

  it 'has link to sort hostels alphabatacally' do
    visit "cities/#{@city.id}/hostels"

    expect(page).to have_link('Sort', :href=>"/cities/#{@city.id}/hostels?order=name")
  end

  it 'orders hostels alphabatacally' do
    visit "/cities/#{@city.id}/hostels"
    click_on('Sort')

    expect(@hostel2.name).to appear_before(@hostel1.name)
    expect(page).to have_current_path("/cities/#{@city.id}/hostels?order=name")
  end

  it "links to a create new hostel by city page" do
    visit "/cities/#{@city.id}/hostels"

    click_on('Add Hostel')
    expect(current_path).to eq("/cities/#{@city.id}/hostels/new")
  end

  it "links back to city show page" do
    visit "/cities/#{@city.id}/hostels"

    expect(page).to have_link('Back', :href=> "/cities/#{@city.id}")
  end
end
