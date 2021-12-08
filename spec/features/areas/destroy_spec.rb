require 'rails_helper'

RSpec.describe 'destroying an area' do

  it 'can destroy an area from the index page' do
    Area.delete_all
    area = Area.create!(name: 'Red Rock', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')
    # binding.pry
    visit '/areas'
    click_button "Delete"
    expect(current_path).to eq('/areas')
    expect(page).to_not have_content('Red Rock')
  end


  it 'can destroy an area from the show page' do
    area = Area.create!(name: 'Red Rock', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')
    visit "/areas/#{area.id}"
    click_button "Delete"
    expect(current_path).to eq('/areas')
    expect(page).to_not have_content('Red Rock')
  end



end
