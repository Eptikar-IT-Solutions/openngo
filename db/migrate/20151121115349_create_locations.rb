class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :state_id
      t.string :name

      t.timestamps null: true
    end
  end
end
