class AddAttachmentTimelineImageToGroups < ActiveRecord::Migration
  def self.up
    change_table :groups do |t|
      t.attachment :timeline_image
    end
  end

  def self.down
    remove_attachment :groups, :timeline_image
  end
end
