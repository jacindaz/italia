class AddRegionsTable < ActiveRecord::Migration
  def change
    create_table :regions do |t|
      t.string :english_name, null: false
      t.string :native_language_name
      t.text :description
      t.string :region_website

      t.timestamps
    end
  end
end
