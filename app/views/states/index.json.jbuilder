json.array!(@states) do |state|
  json.extract! state, :id, :name
  json.url state_url(state, format: :json)
end
