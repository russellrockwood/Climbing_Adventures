class Climb < ApplicationRecord
  belongs_to :area

  def self.climbs_true
    Climb.where(dangerous_falls: true)
  end

  def self.min_pitch(min_pitch)
    # binding.pry
    Climb.where("min_pitch > ?", min_pitch)

  end

  def self.climbs_alphabetical
    Climb.all.order('name DESC')
  end

end
