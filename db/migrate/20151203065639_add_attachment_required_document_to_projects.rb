class AddAttachmentRequiredDocumentToProjects < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.attachment :required_document
    end
  end

  def self.down
    remove_attachment :projects, :required_document
  end
end
