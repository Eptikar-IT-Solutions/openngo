json.array!(@users) do |user|
  json.extract! user, :id, :name, :full_name, :mobile, :email, :password_digest, :active
  json.url user_url(user, format: :json)
end
