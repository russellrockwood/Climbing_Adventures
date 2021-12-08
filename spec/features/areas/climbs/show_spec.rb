require 'rails_helper'

RSpec.describe 'the climbs show page' do

    it 'can show climb' do
    area = Area.create!(name: 'Yosemite', nearest_city: 'El Portal', state: 'California',
    has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')
    royal_arches = area.climbs.create!(name: 'Royal Arches', sport_or_trad: 'trad', yds_difficulty: '5.10a',
    number_of_pitches: 15, number_of_draws: 0, dangerous_falls: false)

    visit "/areas/#{area.id}/climbs"

    expect(page).to have_content('Royal Arches')
    expect(page).to have_content('Sport or Trad? - trad')
    expect(page).to have_content('Yosemite Decimal System Difficulty - 5.10a')
    expect(page).to have_content('Number of pitches - 15')
    expect(page).to have_content('Number of draws required - 0')
    expect(page).to have_content('Is there dangerous fall potential? - false')
  end


  end
end
