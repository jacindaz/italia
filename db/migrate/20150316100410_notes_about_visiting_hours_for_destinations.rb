class NotesAboutVisitingHoursForDestinations < ActiveRecord::Migration
  def change
    add_column :destinations, :notes_about_visiting, :text
  end
end
