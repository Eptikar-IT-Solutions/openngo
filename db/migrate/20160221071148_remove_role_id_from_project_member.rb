class RemoveRoleIdFromProjectMember < ActiveRecord::Migration
  def change
    remove_column :project_members, :role_id, :integer
  end
end
