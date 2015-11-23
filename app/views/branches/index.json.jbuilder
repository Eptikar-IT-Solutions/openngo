json.array!(@branches) do |branch|
  json.extract! branch, :id, :name, :description, :state_id
  json.url branch_url(branch, format: :json)
end
