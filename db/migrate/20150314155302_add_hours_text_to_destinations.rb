class AddHoursTextToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :hours, :text
  end
end
