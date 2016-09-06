class User < ApplicationRecord
  has_and_belongs_to_many :condos
  has_many :searches

  has_secure_password
end
