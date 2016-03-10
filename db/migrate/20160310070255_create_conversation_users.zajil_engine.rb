# This migration comes from zajil_engine (originally 20160207100634)
class CreateConversationUsers < ActiveRecord::Migration
  def change
    create_table :conversation_users do |t|
      t.integer :conversation_id
      t.integer :user_id
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
  end
end
