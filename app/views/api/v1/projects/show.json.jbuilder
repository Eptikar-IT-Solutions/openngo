json.extract! @project, :id, :name, :budget,:from, :to, :goal, :description

json.branch do |json|
  json.(@project.branch, :name)
end

json.project_milestones @project.project_milestones, :name, :expences