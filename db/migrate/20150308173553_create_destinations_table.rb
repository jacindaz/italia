class CreateDestinationsTable < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.text :description
      t.string :destination_website

      t.integer :cost
      t.datetime :hours_open
      t.datetime :hours_close

      t.timestamps
    end
  end
end
