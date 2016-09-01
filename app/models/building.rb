class Building < ApplicationRecord
  geocoded_by :address do |obj,results|
    # Address.create(latitude: building.latitude, longitude: building.longitude)
    self.formatted_address = results.first.formatted_address
  end

  before_validation :geocode
  validates :address, uniqueness: true
  validates :formatted_address, presence: true


end
