json.array!(@organizations) do |organization|
  json.extract! organization, :id, :name, :website, :subdomain, :email, :phone1, :phone2, :fax, :address, :description, :active
  json.url organization_url(organization, format: :json)
end
