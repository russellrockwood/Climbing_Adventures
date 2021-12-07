
require 'rails_helper'

RSpec.describe 'can add climb to area' do
  it 'can add a climb to an area' do
    area = Area.create(name: 'Yosemite', nearest_city: 'El Portal', state: 'California',
    has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')

    visit "/areas/#{area.id}/climbs/new"

    fill_in('name', with: 'Royal Arches')
    fill_in('sport_or_trad', with: 'trad')
    fill_in('yds_difficulty', with: '5.10a')
    fill_in('number_of_pitches', with: '15')
    fill_in('number_of_draws', with: '0')
    fill_in('dangerous_falls', with: 'false')
    click_button('Create new climb')

    expect(current_path).to eq("/areas/#{area.id}/climbs")
    expect(page).to have_content("Royal Arches")
  end

end
