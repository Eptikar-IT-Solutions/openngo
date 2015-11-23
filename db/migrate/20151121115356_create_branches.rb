class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.text :description
      t.integer :state_id

      t.timestamps null: true
    end
  end
end
