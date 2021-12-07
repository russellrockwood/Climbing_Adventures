require 'rails_helper'

RSpec.describe 'the area show view' do

  it 'shows all parent records' do
    red_rock = Area.create!(name: 'Red Rock', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')

    visit "/areas/#{red_rock.id}"

    expect(page).to have_content('Red Rock')
  end

  it 'has links for areas, climbs, indices' do
    red_rock = Area.create!(name: 'Red Rock', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')
    yosemite = Area.create!(name: 'Yosemite', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')

    visit "/areas/#{red_rock.id}"

    expect(page).to have_link('Areas index')
    expect(page).to have_link('Climbs index')
  end

  it 'can show number of climbs' do
    red_rock = Area.create!(name: 'Red Rock', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')
    yosemite = Area.create!(name: 'Yosemite', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')

    visit "/areas/#{red_rock.id}"

    expect(page).to have_content('Number of climbs: 0')
  end

  it 'has link for area climbs' do
    red_rock = Area.create!(name: 'Red Rock', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')
    yosemite = Area.create!(name: 'Yosemite', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')

    visit "/areas/#{red_rock.id}"

    expect(page).to have_link('Area Climbs')
  end


end
