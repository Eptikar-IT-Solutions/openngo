json.array!(@professions) do |profession|
  json.extract! profession, :id, :name
  json.url profession_url(profession, format: :json)
end
