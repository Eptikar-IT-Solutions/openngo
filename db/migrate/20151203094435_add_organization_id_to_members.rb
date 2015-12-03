class AddOrganizationIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :organization_id, :integer
  end
end
