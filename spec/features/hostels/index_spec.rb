require 'rails_helper'

RSpec.describe 'Hostels index page', type: :feature do
  before(:each) do
    @city1 = City.create(
      name: 'Townsville',
      travel_advisory: false,
      population: 50)
    @hostel1 = Hostel.create(
      name: 'Small Hostel',
      vacancies: true,
      max_occupancy: 15,
      city_id: @city1.id
    )
    @hostel2 = Hostel.create!(
      name: 'Big Hostel',
      vacancies: true,
      max_occupancy: 25,
      city_id: @city1.id
    )
  end
  it 'can see all hostels and attributes' do
    visit '/hostels'

    expect(page).to have_link(@hostel1.name, :href=>"/hostels/#{@hostel1.id}")
    expect(page).to have_content(@hostel1.vacancies)
    expect(page).to have_content(@hostel1.max_occupancy)
    expect(page).to have_content(@hostel1.created_at)
    expect(page).to have_content(@hostel1.updated_at)

    expect(page).to have_link(@hostel2.name, :href=>"/hostels/#{@hostel2.id}")
    expect(page).to have_content(@hostel2.vacancies)
    expect(page).to have_content(@hostel2.max_occupancy)
    expect(page).to have_content(@hostel2.created_at)
    expect(page).to have_content(@hostel2.updated_at)
  end

  it 'has link to cities index' do
    visit '/hostels'

    expect(page).to have_link('Cities', :href=>'/cities')
  end

  it "has link to update hostels" do
    visit '/hostels'

    expect(page).to have_link('Update', :href=> "/hostels/#{@hostel1.id}/edit")
  end
end
