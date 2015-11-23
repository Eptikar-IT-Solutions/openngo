class CreateProjectPartners < ActiveRecord::Migration
  def change
    create_table :project_partners do |t|
      t.integer :project_id
      t.integer :organization_id

      t.timestamps null: true
    end
  end
end
