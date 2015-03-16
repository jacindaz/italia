class HolidaysClosedColumnToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :closed_holidays, :text, array: true
  end
end
