require "rails_helper"

RSpec.describe Hostel do
  # describe 'instance methods' do
    # call an instance method on a class
  # end

  describe 'class methods' do
    it 'only shows hostels with vacancies' do
      @city1 = City.create(
        name: 'Townsville',
        travel_advisory: false,
        population: 50)
      @hostel1 = Hostel.create(
        name: 'Big Hostel',
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

      expect(@city1.hostels.hostels_with_vacancies.length).to eq(1)
    end
  end

  describe 'relationships' do
    it {should belong_to(:city)}
  end
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end
end
