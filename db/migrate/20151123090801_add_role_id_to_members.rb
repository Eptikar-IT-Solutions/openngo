class AddRoleIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :role_id, :integer
  end
end
