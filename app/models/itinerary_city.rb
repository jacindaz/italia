class ItineraryCity < ActiveRecord::Base
  belongs_to :city 
  belongs_to :itinerary 
end