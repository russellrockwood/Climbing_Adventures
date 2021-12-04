require 'rails_helper'

RSpec.describe 'new city page', type: :feature do
  it "has new city input fields" do

    visit '/cities/new'

    expect(page).to have_field("city_name")
    expect(page).to have_field("Travel Advisory", checked: false)
    expect(page).to have_field("population")
    expect(page).to have_selector("input[type=submit]")
  end
end
