class AddAttachmentThumbnailImageToUniversities < ActiveRecord::Migration
  def self.up
    change_table :universities do |t|
      t.attachment :thumbnail_image
    end
  end

  def self.down
    remove_attachment :universities, :thumbnail_image
  end
end
