class ChangeDefaultValueForRoleInUsers < ActiveRecord::Migration
  def change
    change_column :users, :role_id, :integer, default: Role.find_or_create_by(name: 'Admin').id
  end
end
