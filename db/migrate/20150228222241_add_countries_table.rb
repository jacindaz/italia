class AddCountriesTable < ActiveRecord::Migration
  def change
    create_table :countries do |t| 
      t.string :english_name, null: false
      t.string :native_language_name
      t.text :description
      t.string :country_website

      t.timestamps
    end
  end
end
