class CreateProjectAttachments < ActiveRecord::Migration
  def change
    create_table :project_attachments do |t|
      t.integer :attachment_id
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
