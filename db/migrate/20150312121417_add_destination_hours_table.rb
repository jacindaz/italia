class AddDestinationHoursTable < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.string :day_of_week, null: false
      t.integer :hours_open
      t.integer :hours_close
      t.boolean :closed_entire_day, null: false
      t.timestamps

      t.index :day_of_week
    end

    create_join_table :destinations, :hours do |t|
      t.index :destination_id
      t.index :hour_id
    end
  end
end
