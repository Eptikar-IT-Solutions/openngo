json.array!(@activity_locations) do |activity_location|
  json.extract! activity_location, :id, :activity_id, :location_id
  json.url activity_location_url(activity_location, format: :json)
end
