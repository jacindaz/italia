class AddAttachmentThumbnailToDestinations < ActiveRecord::Migration
  def self.up
    change_table :destinations do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :destinations, :thumbnail
  end
end
