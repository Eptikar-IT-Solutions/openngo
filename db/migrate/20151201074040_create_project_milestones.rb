class CreateProjectMilestones < ActiveRecord::Migration
  def change
    create_table :project_milestones do |t|
      t.string :name
      t.text :description
      t.decimal :expences
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
