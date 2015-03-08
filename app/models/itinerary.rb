class Itinerary < ActiveRecord::Base
  has_many :cities, through: :itinerary_cities
  has_many :itinerary_cities, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end