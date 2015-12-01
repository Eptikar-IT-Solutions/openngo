class RemoveProjectIdFromProjectMilestones < ActiveRecord::Migration
  def change
    remove_column :project_milestones, :Project_id, :integer
  end
end
