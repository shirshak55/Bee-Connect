class AddAttachmentThumbnailImageToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :thumbnail_image
    end
  end

  def self.down
    remove_attachment :groups, :thumbnail_image
  end
end
