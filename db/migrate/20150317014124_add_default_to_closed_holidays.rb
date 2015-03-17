class AddDefaultToClosedHolidays < ActiveRecord::Migration
  def change
    change_column_default :destinations, :closed_holidays, []
  end
end
