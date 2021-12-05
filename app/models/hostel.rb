class Hostel < ApplicationRecord
  belongs_to :city
  validates_presence_of :name

  def self.hostels_with_vacancies
    Hostel.where(vacancies: true)
  end
end
