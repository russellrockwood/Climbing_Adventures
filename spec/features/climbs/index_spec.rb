require 'rails_helper'

RSpec.describe 'the climbs index page' do

  it 'displays only true climbs on index page' do
    area = Area.create(name: 'Yosemite', nearest_city: 'El Portal', state: 'California',
    has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')
    royal_arches = area.climbs.create(name: 'Royal Arches', sport_or_trad: 'trad', yds_difficulty: '5.10a',
    number_of_pitches: 15, number_of_draws: 0, dangerous_falls: false)
    dawn_wall = area.climbs.create(name: 'The Dawn Wall', sport_or_trad: 'trad', yds_difficulty: '5.14c',
    number_of_pitches: 32, number_of_draws: 0, dangerous_falls: true)

    visit "/climbs"

    expect(page).to have_content('The Dawn Wall')
    expect(page).to have_no_content('Royal Arches')
  end


end
