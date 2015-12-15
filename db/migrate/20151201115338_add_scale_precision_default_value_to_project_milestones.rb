class AddScalePrecisionDefaultValueToProjectMilestones < ActiveRecord::Migration
  def change
    change_column :project_milestones, :expences, :decimal, precision: 12, scale: 2, default: 0.00
  end
end
