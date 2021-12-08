class City < ApplicationRecord
  has_many :hostels, :dependent => :destroy
  validates_presence_of :name

  def self.cities_desc
    City.order('created_at DESC')
  end
end
