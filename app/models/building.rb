class Building < ApplicationRecord
  geocoded_by :address
  before_validation :geocode
  validates :address, uniqueness: true
end
