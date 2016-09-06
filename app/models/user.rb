class User < ApplicationRecord
  has_and_belongs_to_many :condos
  has_many :searches
  validates :email, presence: true, uniqueness: true
  has_secure_password
end
