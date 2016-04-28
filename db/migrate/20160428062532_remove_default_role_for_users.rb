class RemoveDefaultRoleForUsers < ActiveRecord::Migration
  def change
    change_column :users, :role_id, :integer, default: nil
  end
end
