class ChangeUserLocaleToLanguage < ActiveRecord::Migration
  def change
    rename_column :users, :locale, :language
  end
end
