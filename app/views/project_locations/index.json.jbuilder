json.array!(@project_locations) do |project_location|
  json.extract! project_location, :id, :project_id, :location_id
  json.url project_location_url(project_location, format: :json)
end
