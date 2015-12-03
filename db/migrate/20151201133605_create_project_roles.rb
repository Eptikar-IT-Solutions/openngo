class CreateProjectRoles < ActiveRecord::Migration
  def change
    create_table :project_roles do |t|
      t.integer :role_id
      t.integer :project_id
      t.integer :member_id
      t.text :description

      t.timestamps null: false
    end
  end
end
