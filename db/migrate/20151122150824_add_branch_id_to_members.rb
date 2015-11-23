class AddBranchIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :branch_id, :integer
  end
end
