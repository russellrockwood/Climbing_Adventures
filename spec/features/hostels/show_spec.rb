require 'rails_helper'

RSpec.describe 'Hostel show page', type: :feature do
  before(:each) do
    @city1 = City.create(
      name: 'Townsville',
      travel_advisory: false,
      population: 50)
    @hostel1 = Hostel.create(
      name: 'Small Hostel',
      vacancies: true,
      max_occupancy: 15,
      city_id: @city1.id)
  end
  it 'has all information for one hostel' do
    visit "/hostels/#{@hostel1.id}"

    expect(page).to have_content(@hostel1.name)
    expect(page).to have_content(@hostel1.vacancies)
    expect(page).to have_content(@hostel1.max_occupancy)
    expect(page).to have_content(@hostel1.created_at)
    expect(page).to have_content(@hostel1.updated_at)
  end

  it "has a link to hostels index" do
    visit "/hostels/#{@hostel1.id}"

    expect(page).to have_link("Hostel Index", :href=>"/hostels")
  end

  it "has a link to hostel edit page" do
    visit "/hostels/#{@hostel1.id}"

    expect(page).to have_link("Update", :href=>"/hostels/#{@hostel1.id}/edit")
  end

  it "has a link to delete hostel" do
    visit "/hostels/#{@hostel1.id}"

    expect(page).to have_link("Delete #{@hostel1.name}", :href=>"/hostels/#{@hostel1.id}")
  end

  it "removes hostel" do
    visit "/hostels/#{@hostel1.id}"
    click_link("Delete #{@hostel1.name}")

    expect(current_path).to eq('/hostels')
    expect(page).to have_no_content("Small Hostel")
  end
end
