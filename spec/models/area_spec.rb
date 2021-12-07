require 'rails_helper'

RSpec.describe Area do
  it {should have_many :climbs}
end
