require "rails_helper"

RSpec.describe Hostel do
  before(:each) do
    @city1 = City.create(
      name: 'Townsville',
      travel_advisory: false,
      population: 50)
    @hostel1 = Hostel.create(
      name: 'Small Hostel',
      vacancies: true,
      max_occupancy: 15,
      city_id: @city1.id
    )
    @hostel2 = Hostel.create!(
      name: 'Big Hostel',
      vacancies: false,
      max_occupancy: 25,
      city_id: @city1.id
    )
  end

  describe 'class methods' do
    it 'only shows hostels with vacancies' do
      expect(Hostel.hostels_with_vacancies.include?(@hostel1)).to eq(true)
      expect(Hostel.hostels_with_vacancies.include?(@hostel2)).to eq(false)
    end

    it "can sort hostels alphabatacally" do
      expect(Hostel.alphabetical.first).to eq(@hostel2)
      expect(Hostel.alphabetical.last).to eq(@hostel1)
    end

    it "finds hostels with where max occupany meets input threshold" do
      expect(Hostel.occupancy_threshold(16).include?(@hostel1)).to eq(false)
      expect(Hostel.occupancy_threshold(16).include?(@hostel2)).to eq(true)
    end
  end

  describe 'relationships' do
    it {should belong_to(:city)}
  end
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end
end
