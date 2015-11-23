json.array!(@members) do |member|
  json.extract! member, :id, :name, :gender, :joined_at, :email, :mobile, :address, :profession, :education, :branch_id, :role_id, :bio, :active
  json.url member_url(member, format: :json)
end
