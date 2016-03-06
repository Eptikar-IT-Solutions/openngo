# This migration comes from zajil_engine (originally 20160216134739)
class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users do |t|
      t.integer :user_id
      t.integer :message_group_id

      t.timestamps null: false
    end
  end
end
