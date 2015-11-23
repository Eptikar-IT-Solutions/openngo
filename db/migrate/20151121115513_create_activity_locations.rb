class CreateActivityLocations < ActiveRecord::Migration
  def change
    create_table :activity_locations do |t|
      t.integer :activity_id
      t.integer :location_id

      t.timestamps null: true
    end
  end
end
