# This migration comes from zajil_engine (originally 20160208095917)
class CreateConversationTypes < ActiveRecord::Migration
  def change
    create_table :conversation_types do |t|
      t.string :title
      t.text :default_text
      t.string :icon
      t.boolean :partial
      t.integer :created_by
      t.integer :updated_by

      t.timestamps null: false
    end
  end
end
