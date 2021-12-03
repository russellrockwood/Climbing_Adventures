require "rails_helper"

RSpec.describe Hostel do
  # describe 'instance methods' do
    # call an instance method on a class
  # end

  # describe 'class methods'

  describe 'relationships' do
    it {should belong_to(:city)}
  end
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end
end
