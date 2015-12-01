class AddProjectIdFromProjectMilestones < ActiveRecord::Migration
  def change
    add_column :project_milestones, :project_id, :integer
  end
end
