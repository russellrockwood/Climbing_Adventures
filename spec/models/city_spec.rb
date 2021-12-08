require "rails_helper"

RSpec.describe City do
  # describe 'instance methods' do
    # call an instance method on a class
  # end


  describe 'class methods' do
    it 'orders cities by last created' do
      city1 = City.create(
        name: 'Townsville',
        travel_advisory: true,
        population: 50)
      city2 = City.create(
        name: 'Hillsboro',
        travel_advisory: true,
        population: 60)

       expect(City.cities_desc).to eq([city2,city1])
    end

  end

  describe 'relationships' do
    it {should have_many(:hostels)}
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

end
