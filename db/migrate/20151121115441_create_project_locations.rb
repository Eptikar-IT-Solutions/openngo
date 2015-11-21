class CreateProjectLocations < ActiveRecord::Migration
  def change
    create_table :project_locations do |t|
      t.integer :project_id
      t.integer :location_id

      t.timestamps null: false
    end
  end
end
