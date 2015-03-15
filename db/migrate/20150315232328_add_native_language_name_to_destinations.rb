class AddNativeLanguageNameToDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :native_language_name, :text
    rename_column :destinations, :name, :english_name
  end
end
