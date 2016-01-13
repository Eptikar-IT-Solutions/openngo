class AddOrganizationIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :organization_id, :integer
  end
end
