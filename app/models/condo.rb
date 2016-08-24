class Condo < ApplicationRecord
  geocoded_by :address
  before_validation :geocode
end
