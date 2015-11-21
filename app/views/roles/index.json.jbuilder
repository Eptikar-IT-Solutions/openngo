json.array!(@roles) do |role|
  json.extract! role, :id, :name, :project_id
  json.url role_url(role, format: :json)
end
