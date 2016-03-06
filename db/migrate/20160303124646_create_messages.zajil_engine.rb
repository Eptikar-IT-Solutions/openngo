# This migration comes from zajil_engine (originally 20160207100619)
class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :conversation_id
      t.integer :parent_id
      t.integer :user_id
      t.text :body
      t.integer :message_type
      t.text :metadata
      t.string :alert_class
      t.boolean :system_message
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
  end
end
