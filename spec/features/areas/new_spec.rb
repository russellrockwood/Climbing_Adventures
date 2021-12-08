require 'rails_helper'

RSpec.describe 'the Artist Creation' do
  it 'links to the new page from the area index' do
    visit '/areas'

    click_link('New Area')
    expect(current_path).to eq('/areas/new')
  end

  it 'can create a new area' do
    visit '/areas/new'

    fill_in('name', with: 'Red Rock')
    fill_in('nearest_city', with: 'Las Vegas')
    fill_in('state', with: 'Nevada')
    fill_in('has_free_camping', with: 'false')
    fill_in('cost_for_paid_camping', with: '20')
    fill_in('rock_type', with: 'Sandstone')
    click_button('Create Area')
    new_area_id = Area.last.id
    expect(current_path).to eq("/areas")
    expect(page).to have_content("Red Rock")
  end



end
