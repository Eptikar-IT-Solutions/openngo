class AddLocationToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :location_id, :integer
  end
end
