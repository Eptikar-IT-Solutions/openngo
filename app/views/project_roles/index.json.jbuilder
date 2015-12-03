json.array!(@project_roles) do |project_role|
  json.extract! project_role, :id, :role_id, :project_id, :description
  json.url project_role_url(project_role, format: :json)
end
