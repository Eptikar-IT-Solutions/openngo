# This migration comes from zajil_engine (originally 20160207100608)
class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.integer :conversation_type_id
      t.string :messageable_type
      t.integer :messageable_id
      t.text :body
      t.integer :messages_count
      t.boolean :locked
      t.text :fields
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
  end
end
