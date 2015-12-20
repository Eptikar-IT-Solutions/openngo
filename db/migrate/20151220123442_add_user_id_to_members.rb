class AddUserIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :user_id, :integer
  end
end
