class RemoveHoursFromDestinations < ActiveRecord::Migration
  def change
    remove_column :destinations, :hours_open
    remove_column :destinations, :hours_close
  end
end
