class AddAttachmentImageToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :posts, :attachment
  end
end
