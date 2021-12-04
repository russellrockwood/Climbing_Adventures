require 'rails_helper'

RSpec.describe 'new hostel page', type: :feature do
  it "has new hostel input fields" do
    @city1 = City.create(
      name: 'Townsville',
      travel_advisory: false,
      population: 50)

    visit "/cities/#{@city1.id}/hostels/new"

    expect(page).to have_content("Add Hostel")
    expect(page).to have_field("hostel_name")
    expect(page).to have_field("Vacancies", checked: false)
    expect(page).to have_field("max_occupancy")
    expect(page).to have_selector("input[type=submit]")
  end
end
