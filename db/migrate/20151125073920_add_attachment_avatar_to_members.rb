class AddAttachmentAvatarToMembers < ActiveRecord::Migration
  def self.up
    change_table :members do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :members, :avatar
  end
end
