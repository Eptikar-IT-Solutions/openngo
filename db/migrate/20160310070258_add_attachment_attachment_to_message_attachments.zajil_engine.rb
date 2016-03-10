# This migration comes from zajil_engine (originally 20160215074146)
class AddAttachmentAttachmentToMessageAttachments < ActiveRecord::Migration
  def self.up
    change_table :message_attachments do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :message_attachments, :attachment
  end
end
