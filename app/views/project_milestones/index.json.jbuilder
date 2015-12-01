json.array!(@project_milestones) do |project_milestone|
  json.extract! project_milestone, :id, :name, :description, :expences, :project_id
  json.url project_milestone_url(project_milestone, format: :json)
end
