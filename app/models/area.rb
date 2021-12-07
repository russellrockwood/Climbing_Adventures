class Area < ApplicationRecord
  has_many :climbs

  def self.areas_desc
    Area.all.order('created_at DESC')
  end
end
