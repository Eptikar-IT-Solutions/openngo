class MoveIdFromMembersToUsers < ActiveRecord::Migration
  def change
    remove_column :members, :user_id, :integer
    add_column :users, :member_id, :integer
  end
end
