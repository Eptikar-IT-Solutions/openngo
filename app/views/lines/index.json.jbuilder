json.array!(@lines) do |line|
  json.extract! line, :id, :name, :quantity, :cost
  json.url line_url(line, format: :json)
end
