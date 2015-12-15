class ChangeFromToDateFormatInActivities < ActiveRecord::Migration
  def change
    change_column :activities, :from, :date
    change_column :activities, :to, :date
  end
end
