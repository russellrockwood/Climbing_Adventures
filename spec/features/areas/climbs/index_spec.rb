# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

require 'rails_helper'

RSpec.describe 'Climbs in area index' do
  it 'shows all of the titles for the climbs for the area' do
    area = Area.create!(name: 'Yosemite', nearest_city: 'El Portal', state: 'California',
    has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')
    royal_arches = area.climbs.create(name: 'Royal Arches', sport_or_trad: 'trad', yds_difficulty: '5.10a',
    number_of_pitches: 15, number_of_draws: 0, dangerous_falls: false)
    dawn_wall = area.climbs.create(name: 'The Dawn Wall', sport_or_trad: 'trad', yds_difficulty: '5.14c',
    number_of_pitches: 32, number_of_draws: 0, dangerous_falls: true)


    visit "/areas/#{area.id}/climbs"
    expect(page).to have_content(royal_arches.name)
    expect(page).to have_content(dawn_wall.name)
  end

  it 'can sort the climbs alphabetically' do
    area = Area.create!(name: 'Yosemite', nearest_city: 'El Portal', state: 'California',
    has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')
    royal_arches = area.climbs.create(name: 'Royal Arches', sport_or_trad: 'trad', yds_difficulty: '5.10a',
    number_of_pitches: 15, number_of_draws: 0, dangerous_falls: false)
    dawn_wall = area.climbs.create(name: 'Dawn Wall', sport_or_trad: 'trad', yds_difficulty: '5.14c',
    number_of_pitches: 32, number_of_draws: 0, dangerous_falls: true)
    separate_reality = area.climbs.create(name: 'Separate Reality', sport_or_trad: 'trad', yds_difficulty: '5.12a',
    number_of_pitches: 1, number_of_draws: 0, dangerous_falls: true)

    visit "/areas/#{area.id}/climbs"

    click_on "Sort alphabetically"

    expect(page).to have_content(royal_arches.name)
    expect(page).to have_content(dawn_wall.name)

    expect('Royal Arches').to appear_before('Separate Reality')
    expect('Dawn Wall').to appear_before('Separate Reality')
    expect('Dawn Wall').to appear_before('Royal Arches')

  end

  it 'can only show climbs with a certain number of pitches' do
    area = Area.create!(name: 'Yosemite', nearest_city: 'El Portal', state: 'California',
    has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')
    royal_arches = area.climbs.create(name: 'Royal Arches', sport_or_trad: 'trad', yds_difficulty: '5.10a',
    number_of_pitches: 15, number_of_draws: 0, dangerous_falls: true)
    dawn_wall = area.climbs.create(name: 'The Dawn Wall', sport_or_trad: 'trad', yds_difficulty: '5.14c',
    number_of_pitches: 32, number_of_draws: 0, dangerous_falls: true)
    separate_reality = area.climbs.create(name: 'Separate Reality', sport_or_trad: 'trad', yds_difficulty: '5.12a',
    number_of_pitches: 1, number_of_draws: 0, dangerous_falls: true)

    visit "/areas/#{area.id}/climbs"
    fill_in 'number_of_pitches', with: '2'
    click_on 'Only return climbs with at least this many pitches'
    expect(page).to_not have_content('Separate Reality')

  end
end
