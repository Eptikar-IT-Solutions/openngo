class CreateActivityMembers < ActiveRecord::Migration
  def change
    create_table :activity_members do |t|
      t.integer :activity_id
      t.integer :member_id
      t.integer :role_id

      t.timestamps null: true
    end
  end
end
