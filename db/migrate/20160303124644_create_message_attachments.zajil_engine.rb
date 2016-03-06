# This migration comes from zajil_engine (originally 20160207075709)
class CreateMessageAttachments < ActiveRecord::Migration
  def change
    create_table :message_attachments do |t|
      t.integer :message_id
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
  end
end
