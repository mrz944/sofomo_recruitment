class Geolocation < ApplicationRecord
  #
  # VALIDATIONS
  #

  validates :ip, presence: true
  validates :name, uniqueness: true
  validates :latitude, presence: true
  validates :longitude, presence: true
end
