class City < ApplicationRecord
  has_many :hostels
  validates_presence_of :name
end
