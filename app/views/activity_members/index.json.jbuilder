json.array!(@activity_members) do |activity_member|
  json.extract! activity_member, :id, :activity_id, :member_id
  json.url activity_member_url(activity_member, format: :json)
end
