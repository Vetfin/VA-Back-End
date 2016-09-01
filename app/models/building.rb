class Building < ApplicationRecord
  geocoded_by :address do |obj,results|
    Address.create(latitude: building.latitude, longitude: building.longitude)
  end

  # before_validation :geocode
  validates :address, uniqueness: true
end
