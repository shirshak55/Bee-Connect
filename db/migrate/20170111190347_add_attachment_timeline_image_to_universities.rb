class AddAttachmentTimelineImageToUniversities < ActiveRecord::Migration
  def self.up
    change_table :universities do |t|
      t.attachment :timeline_image
    end
  end

  def self.down
    remove_attachment :universities, :timeline_image
  end
end
