class Address < ApplicationRecord
  reverse_geocoded_by :latitude, :longitude
  before_validation :reverse_geocode
  validates :address, uniqueness: true
end
