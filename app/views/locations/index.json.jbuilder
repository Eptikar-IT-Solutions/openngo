json.array!(@locations) do |location|
  json.extract! location, :id, :state_id, :name
  json.url location_url(location, format: :json)
end
