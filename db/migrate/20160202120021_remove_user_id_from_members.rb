class RemoveUserIdFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :role_id, :integer
  end
end
