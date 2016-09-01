class Building < ApplicationRecord
  geocoded_by :address do |obj,results|
    # Address.create(latitude: building.latitude, longitude: building.longitude)
    obj.formatted_address = results.first.formatted_address if results.first
  end

  before_validation :geocode
  validates :address, uniqueness: true
  validates :formatted_address, presence: true
  has_many :condos


end
