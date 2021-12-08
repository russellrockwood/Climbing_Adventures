class Hostel < ApplicationRecord
  belongs_to :city
  validates_presence_of :name

  def self.hostels_with_vacancies
    Hostel.where(vacancies: true)
  end

  def self.alphabetical
    Hostel.order('name')
  end

  def self.occupancy_threshold(num)
    Hostel.where("max_occupancy >= ?", num)
  end
end
