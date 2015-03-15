class ChangeAddressColumnToStreetAddress < ActiveRecord::Migration
  def change
    rename_column :addresses, :address, :street_address
  end
end
