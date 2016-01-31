class AddAttachmentFileToProjectAttachments < ActiveRecord::Migration
  def self.up
    change_table :project_attachments do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :project_attachments, :file
  end
end
