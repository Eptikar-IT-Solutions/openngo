class RemoveAttachmentIdFromProjectAttchments < ActiveRecord::Migration
  def change
    remove_column :project_attachments, :attachment_id, :integer
  end
end
