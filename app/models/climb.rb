class Climb < ApplicationRecord
  belongs_to :area

  def self.climbs_true
    Climb.where(dangerous_falls: true)
  end

  def self.alphabetical
    Climb.order('name')
  end

end
