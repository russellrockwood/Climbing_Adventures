require 'rails_helper'

RSpec.describe 'City show page', type: :feature do
  before(:each) do
    @city1 = City.create(
      name: 'Townsville',
      travel_advisory: false,
      population: 50)
  end


  it 'has city information' do
    visit "/cities/#{@city1.id}"
    expect(page).to have_content(@city1.name)
    expect(page).to have_content(@city1.travel_advisory)
    expect(page).to have_content(@city1.population)
    expect(page).to have_content('Number of Hostels: 0')
    expect(page).to have_content(@city1.created_at)
    expect(page).to have_content(@city1.updated_at)
  end

  it "has a link to hostels in the city" do
    visit "/cities/#{@city1.id}"

    expect(page).to have_link("#{@city1.name} Hostels", :href=>"/cities/#{@city1.id}/hostels")
  end

  it "has a link to delete city" do
    visit "/cities/#{@city1.id}"

    expect(page).to have_link("Delete #{@city1.name}", :href=>"/cities/#{@city1.id}")
  end

  it "removes city" do
    visit "/cities/#{@city1.id}"
    click_link("Delete #{@city1.name}")

    expect(current_path).to eq('/cities')
    expect(page).to have_no_content("Townsville")
  end


end
