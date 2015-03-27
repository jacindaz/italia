class ChangeDestinationAddressAssociation < ActiveRecord::Migration
  def up
    add_column :addresses, :destination_id, :integer

    Destination.all.each do |d|
      binding.pry
      address = Address.find(d.address_id)
      address.destination_id = d.id
      address.save!
    end

    remove_column :destinations, :address_id
  end

  def down
    add_column :destinations, :address_id, :integer

    Address.all.each do |a|
      destination = Destination.find(a.destination_id)
      destination.address_id = a.id
      destination.save!
    end

    remove_column :addresses, :destination_id
  end

end
