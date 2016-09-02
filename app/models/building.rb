class Building < ApplicationRecord
  geocoded_by :address do |obj,results|
    obj.formatted_address = results.first.formatted_address if results.first
  end

  before_validation :geocode
  validates :address, uniqueness: true
  validates :formatted_address, presence: true
  has_many :condos, dependent: :destroy


end
