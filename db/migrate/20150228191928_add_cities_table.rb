class AddCitiesTable < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :english_name, null: false 
      t.string :native_language_name
      t.text :description 
      t.string :is_capital, null: false
      t.string :city_website

      t.timestamps
    end
  end
end
