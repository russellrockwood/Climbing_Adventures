require 'rails_helper'

RSpec.describe Area do
  it {should have_many :climbs}

  describe 'area methods' do

    it 'test climb methods - order' do
      @yosemite = Area.create!(name: 'Yosemite', nearest_city: 'El Portal', state: 'California',
      has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')
      @red_rock = Area.create!(name: 'Red Rock', nearest_city: 'El Portal', state: 'California',
      has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')

      expect(Area.areas_desc.first.name).to eq('Red Rock')
    end

    it 'test climb methods' do
      @area = Area.create!(name: 'Yosemite', nearest_city: 'El Portal', state: 'California',
      has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')
      royal_arches = @area.climbs.create(name: 'Royal Arches', sport_or_trad: 'trad', yds_difficulty: '5.10a',
      number_of_pitches: 15, number_of_draws: 0, dangerous_falls: false)
      dawn_wall = @area.climbs.create(name: 'Dawn Wall', sport_or_trad: 'trad', yds_difficulty: '5.14c',
      number_of_pitches: 32, number_of_draws: 0, dangerous_falls: true)
      separate_reality = @area.climbs.create(name: 'Separate Reality', sport_or_trad: 'trad', yds_difficulty: '5.12a',
      number_of_pitches: 1, number_of_draws: 0, dangerous_falls: true)


      expect(@area.min_pitch(10).first.name).to eq('Royal Arches')
    end



  end
end
