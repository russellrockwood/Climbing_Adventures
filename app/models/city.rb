class City < ApplicationRecord
  has_many :hostels
  validates_presence_of :name

  def self.cities_desc
    City.all.order('created_at DESC')
  end
end
