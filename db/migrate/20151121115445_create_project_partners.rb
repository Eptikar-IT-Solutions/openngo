class CreateProjectPartners < ActiveRecord::Migration
  def change
    create_table :project_partners do |t|
      t.integer :project_id
      t.integer :partner_id

      t.timestamps null: false
    end
  end
end
