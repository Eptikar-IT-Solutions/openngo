json.array!(@costs) do |cost|
  json.extract! cost, :id, :total_cost
  json.url cost_url(cost, format: :json)
end
