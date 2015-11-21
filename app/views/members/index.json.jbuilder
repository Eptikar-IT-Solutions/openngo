json.array!(@members) do |member|
  json.extract! member, :id, :name, :gender, :joined_at, :email, :mobile, :address, :profession, :education, :organization, :bio, :active
  json.url member_url(member, format: :json)
end
