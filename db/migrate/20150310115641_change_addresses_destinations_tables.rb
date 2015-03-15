class ChangeAddressesDestinationsTables < ActiveRecord::Migration
  def change
    remove_column :addresses, :destination_id
    remove_column :addresses, :cafe_id
    remove_column :addresses, :restaurant_id
    add_column :destinations, :address_id, :integer, null: false
  end
end
