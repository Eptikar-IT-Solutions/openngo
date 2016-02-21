class ChangeRepeatedTypeInActivities < ActiveRecord::Migration
  def change
    if connection.adapter_name.downcase == 'postgresql'
      change_column :activities, :repeated, 'boolean USING CAST(repeated AS boolean)'
    else
      change_column :activities, :repeated, :boolean
    end
  end
end
