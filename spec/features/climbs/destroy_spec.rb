require 'rails_helper'

RSpec.describe 'climb destroy' do

  it 'can destroy climb' do
    Climb.delete_all
    
    area = Area.create!(name: 'Yosemite', nearest_city: 'El Portal', state: 'California',
    has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')
    royal_arches = area.climbs.create(name: 'Royal Arches', sport_or_trad: 'trad', yds_difficulty: '5.10a',
    number_of_pitches: 15, number_of_draws: 0, dangerous_falls: true)

    visit "/climbs"
    click_on 'Delete'

    expect(page).to_not have_content('Royal Arches')
  end

end
