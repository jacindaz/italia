class ChangeJoinTableName < ActiveRecord::Migration
  def change
    rename_table :destinations_hours, :destination_hours
  end
end
