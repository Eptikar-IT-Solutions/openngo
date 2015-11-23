class CreateProjectDonors < ActiveRecord::Migration
  def change
    create_table :project_donors do |t|
      t.integer :project_id
      t.integer :donor_id

      t.timestamps null: true
    end
  end
end
