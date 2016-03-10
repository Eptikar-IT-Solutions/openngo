# This migration comes from zajil_engine (originally 20160210090400)
class AddTranslationToConversationTypes < ActiveRecord::Migration
  def up
    ConversationType.create_translation_table! title: :string, default_text: :text
  end

  def down
    ConversationType.drop_translation_table!
  end
end
