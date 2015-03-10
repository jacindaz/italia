class AddAddressesTable < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address, null: false
      t.integer :phone_number

      t.integer :cafe_id
      t.integer :restaurant_id
      t.integer :destination_id
      t.integer :city_id, null: false

      t.timestamps
    end
  end
end
