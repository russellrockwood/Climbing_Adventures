require 'rails_helper'

RSpec.describe 'climb edit' do

  it 'can edit climb' do
    area = Area.create!(name: 'Yosemite', nearest_city: 'El Portal', state: 'California',
    has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')
    royal_arches = area.climbs.create(name: 'Roy Arches', sport_or_trad: 'trad', yds_difficulty: '5.10a',
    number_of_pitches: 15, number_of_draws: 0, dangerous_falls: true)

    visit "/climbs"
    click_on 'Update'
    fill_in 'name', with: 'Royal Arches'
    click_button 'Update Climb'
    visit "/climbs/#{royal_arches.id}"

    expect(page).to have_content('Royal Arches')
  end

end
