class AddItineraryTable < ActiveRecord::Migration
  def change
    create_table :itineraries do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :itineraries_cities do |t|
      t.integer :city_id, null: false
      t.integer :itineraries_id, null: false
      t.timestamps
    end
  end
end
