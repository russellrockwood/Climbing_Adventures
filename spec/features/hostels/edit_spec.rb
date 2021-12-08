require 'rails_helper'

RSpec.describe 'Hostels edit page', type: :feature do
  before(:each) do
    @city1 = City.create(
      name: 'Townsville',
      travel_advisory: true,
      population: 50)
    @hostel1 = Hostel.create(
      name: 'Big Hostel',
      vacancies: false,
      max_occupancy: 15,
      city_id: @city1.id)
  end

  it 'updates hostel info' do
    visit "/hostels/#{@hostel1.id}/edit"

    fill_in('Name', with: 'Bigger Hostel')
    check('Vacancies')
    fill_in('max_occupancy', with: 20)
    click_button('Update')

    expect(current_path).to eq("/hostels/#{@hostel1.id}")
    expect(page).to have_content('Bigger Hostel')
    expect(page).to have_content('Vacancies: true')
    expect(page).to have_content('Max Occupancy: 20')
    expect(page).to have_content(@hostel1.created_at)
    expect(page).to have_content(@hostel1.updated_at)
  end

end
