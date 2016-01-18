class AddDefaultValueOfColorCodeInTags < ActiveRecord::Migration
  def change
    change_column :tags, :color_code, :string, default: '#5bc0de'
  end
end