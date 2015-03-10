class AddZipToAddressesTable < ActiveRecord::Migration
  def up
    add_column :addresses, :zip, :string
    change_column :addresses, :phone_number, :string
  end

  def down
    remove_column :addresses, :zip
    change_column :addresses, :phone_number, :integer
  end
end
