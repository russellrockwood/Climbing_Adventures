require 'rails_helper'

RSpec.describe 'the area edit' do

  it 'links to the area edit page' do
    area = Area.create!(name: 'Red Rock', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')
    visit '/areas'

    click_button "Edit #{area.name}"

    expect(current_path).to eq("/areas/#{area.id}/edit")
  end

  it 'can edit the area' do
    area = Area.create!(name: 'R Rock', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')

    visit "/areas/"

    expect(page).to have_content('R Rock')

    click_button 'Edit R Rock'

    fill_in 'name', with: 'Red Rock'
    click_button 'Update Area'

    expect(current_path).to eq("/areas")
    expect(page).to have_content('Red Rock')

  end
end
