json.array!(@project_partners) do |project_partner|
  json.extract! project_partner, :id, :project_id, :partner_id
  json.url project_partner_url(project_partner, format: :json)
end
