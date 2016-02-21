class ChangeRepeatedTypeInActivities < ActiveRecord::Migration
  def up
    change_column :activities, :repeated, :boolean
  end

  def down
    change_column :activities, :repeated, :integer
  end
end
