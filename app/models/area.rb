class Area < ApplicationRecord
  has_many :climbs, :dependent => :destroy

  def self.areas_desc
    Area.all.order('created_at DESC')
  end

  def min_pitch(min_pitches)
    climbs.where("number_of_pitches > ?", min_pitches)
  end

  # def climbs_alphabetical
  #   climbs.order('name ASC')
  # end

end
