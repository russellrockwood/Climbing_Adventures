require 'rails_helper'

RSpec.describe 'Cities edit page', type: :feature do
  it "has city fields to edit" do
    city1 = City.create(
      name: 'Townsville',
      travel_advisory: true,
      population: 50)

      visit "/cities/#{city1.id}/edit"

      expect(page).to have_content(city1.name)
      expect(page).to have_field("travel_advisory")
      expect(page).to have_field("population")


      check('travel_advisory')
      click_on('Update')

      expect(current_path).to eq("/cities/#{city1.id}")
      expect(page).to have_content("Travel Advisory: true" )
  end
end
