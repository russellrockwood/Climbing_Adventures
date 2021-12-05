require 'rails_helper'

# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe 'new hostel page', type: :feature do
  before(:each) do
    @city1 = City.create(
      name: 'Townsville',
      travel_advisory: false,
      population: 50)
  end

  it "has new hostel input fields" do
    visit "/cities/#{@city1.id}/hostels/new"

    expect(page).to have_content("Add Hostel")
    expect(page).to have_field("hostel_name")
    expect(page).to have_field("Vacancies", checked: false)
    expect(page).to have_field("max_occupancy")
    expect(page).to have_selector("input[type=submit]")
  end

  it "creates new hostel" do
    visit "/cities/#{@city1.id}/hostels/new"

    fill_in "hostel_name", with: 'Example Hostel'
    check 'vacancies'
    fill_in "max_occupancy", with: 53
    click_on 'Create Hostel'

    expect(page).to have_current_path("/cities/#{@city1.id}/hostels")
    expect(page).to have_content('Example Hostel')
    expect(page).to have_content('Vacancies: true')
    expect(page).to have_content('Max Occupancy: 53')
  end
end
