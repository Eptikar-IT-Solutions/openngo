json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :project_id, :branch_id, :budget, :description, :from, :to, :repeated
  json.url activity_url(activity, format: :json)
end
