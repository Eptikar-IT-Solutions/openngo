class RemoveProfessionFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :profession, :integer
  end
end
