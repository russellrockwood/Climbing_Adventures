require 'rails_helper'

RSpec.describe 'new city page', type: :feature do
  it "has new city input fields" do
    visit '/cities/new'

    expect(page).to have_field("name")
    expect(page).to have_field("Travel Advisory", checked: false)
    expect(page).to have_field("population")
    expect(page).to have_selector("input[type=submit]")
  end

  it "creates new city" do
    visit '/cities/new'

    fill_in "name", with: 'Example City'
    check 'travel_advisory'
    fill_in 'Population', with: 53000
    click_button 'Add City'

    expect(page).to have_current_path("/cities")
    expect(page).to have_content('Example City')
  end

end
