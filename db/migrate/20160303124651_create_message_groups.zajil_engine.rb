# This migration comes from zajil_engine (originally 20160216134413)
class CreateMessageGroups < ActiveRecord::Migration
  def change
    create_table :message_groups do |t|
      t.string :name
      t.integer :updated_by
      t.integer :created_by
      t.integer :users_count

      t.timestamps null: false
    end
  end
end
