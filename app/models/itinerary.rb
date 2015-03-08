class Itinerary < ActiveRecord::Base
  has_many :cities, through: :itineraries_cities
end