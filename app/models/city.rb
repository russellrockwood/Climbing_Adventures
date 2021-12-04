class City < ApplicationRecord
  has_many :hostels
  validates_presence_of :name

  def self.cities_asc
    City.all.order('created_at ASC')
  end
end
