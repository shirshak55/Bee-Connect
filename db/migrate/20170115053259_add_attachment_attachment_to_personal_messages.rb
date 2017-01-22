class AddAttachmentAttachmentToPersonalMessages < ActiveRecord::Migration
  def self.up
    change_table :personal_messages do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :personal_messages, :attachment
  end
end
