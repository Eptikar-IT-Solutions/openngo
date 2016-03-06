# This migration comes from zajil_engine (originally 20160301101222)
class AddTranslationsToMessages < ActiveRecord::Migration
  def up
    Message.create_translation_table! body: :text
  end

  def down
    Message.drop_translation_table!
  end
end
