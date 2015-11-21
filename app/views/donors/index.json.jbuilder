json.array!(@donors) do |donor|
  json.extract! donor, :id, :name, :email, :phone1, :phone2, :fax, :description
  json.url donor_url(donor, format: :json)
end
