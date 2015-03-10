class AddCitiesTable < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :english_name, null: false 
      t.string :native_language_name
      t.text :description 
      t.boolean :is_capital, null: false
      t.string :city_website
      t.integer :region_id

      t.timestamps null: false
    end
  end
end
