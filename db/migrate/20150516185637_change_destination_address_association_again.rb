class ChangeDestinationAddressAssociationAgain < ActiveRecord::Migration
  def change
    add_column :destinations, :address_id, :integer, null: false
    remove_column :addresses, :destination_id
  end
end
