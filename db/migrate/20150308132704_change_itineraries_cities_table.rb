class ChangeItinerariesCitiesTable < ActiveRecord::Migration
  def change
    rename_table :itineraries_cities, :itinerary_cities
    rename_column :itinerary_cities, :itineraries_id, :itinerary_id
  end
end
