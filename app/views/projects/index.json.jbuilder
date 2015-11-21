json.array!(@projects) do |project|
  json.extract! project, :id, :name, :budget, :from, :to, :goal, :description
  json.url project_url(project, format: :json)
end
