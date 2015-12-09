json.extract! @project, :id, :name, :budget,:from, :to, :goal, :description
json.edit_url edit_project_url(@project) if is_admin

json.branch do |json|
  json.(@project.branch, :id, :name)
end

json.project_milestones @project.project_milestones, :id, :name, :expences