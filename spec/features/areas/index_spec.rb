require 'rails_helper'

RSpec.describe 'the area index view' do

  it 'shows all parent records' do
    red_rock = Area.create!(name: 'Red Rock', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')
    yosemite = Area.create!(name: 'Yosemite', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')

    visit "/areas/"

    expect(page).to have_content('Red Rock')
    expect(page).to have_content('Yosemite')

  end

  it 'has links for areas, climbs, indices' do
    red_rock = Area.create!(name: 'Red Rock', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')
    yosemite = Area.create!(name: 'Yosemite', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')

    visit "/areas/"

    expect(page).to have_link('Areas')
    expect(page).to have_link('Climbs')
  end


  it 'can show when area was created, order correctly' do
    red_rock = Area.create!(name: 'Red Rock', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')
    yosemite = Area.create!(name: 'Yosemite', nearest_city: 'Las Vegas', state: 'Nevada', has_free_camping: 'false', cost_for_paid_camping: '20', rock_type: 'sandstone')

    visit "/areas/"

    expect(page).to have_link('Areas')
    expect(page).to have_link('Climbs')

    expect('Yosemite').to appear_before('Red Rock')
  end



end
