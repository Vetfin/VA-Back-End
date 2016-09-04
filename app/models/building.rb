class Building < ApplicationRecord
  geocoded_by :address do |obj,results|
    if results.first
      obj.formatted_address = results.first.formatted_address
      obj.latitude = results.first.latitude
      obj.longitude = results.first.longitude
  end

  before_validation :geocode
  validates :address, uniqueness: true
  validates :formatted_address, presence: true
  has_many :condos, dependent: :destroy


end
