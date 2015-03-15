class AddDefaultToHoursTable < ActiveRecord::Migration
  def change
    change_column_default :hours, :closed_entire_day, false
  end
end
