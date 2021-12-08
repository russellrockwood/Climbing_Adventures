require 'rails_helper'

RSpec.describe Climb do
  it {should belong_to :area}

  describe 'class methods' do

    it 'test climb methods' do
      @area = Area.create!(name: 'Yosemite', nearest_city: 'El Portal', state: 'California',
      has_free_camping: false, cost_for_paid_camping: 10, rock_type: 'granite')
      royal_arches = @area.climbs.create(name: 'Royal Arches', sport_or_trad: 'trad', yds_difficulty: '5.10a',
      number_of_pitches: 15, number_of_draws: 0, dangerous_falls: false)
      dawn_wall = @area.climbs.create(name: 'Dawn Wall', sport_or_trad: 'trad', yds_difficulty: '5.14c',
      number_of_pitches: 32, number_of_draws: 0, dangerous_falls: true)
      separate_reality = @area.climbs.create(name: 'Separate Reality', sport_or_trad: 'trad', yds_difficulty: '5.12a',
      number_of_pitches: 1, number_of_draws: 0, dangerous_falls: true)

      expect(@area.climbs.alphabetical.first.name).to eq('Dawn Wall')
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

      expect(@area.climbs.climbs_true.first.name).to eq('Dawn Wall')
    end
  end

end
