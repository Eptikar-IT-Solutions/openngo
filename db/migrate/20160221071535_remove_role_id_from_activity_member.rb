class RemoveRoleIdFromActivityMember < ActiveRecord::Migration
  def change
    remove_column :activity_members, :role_id, :integer
  end
end
