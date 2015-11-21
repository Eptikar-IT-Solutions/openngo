json.array!(@project_donors) do |project_donor|
  json.extract! project_donor, :id, :project_id, :donor_id
  json.url project_donor_url(project_donor, format: :json)
end
