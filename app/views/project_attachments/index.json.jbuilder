json.array!(@project_attachments) do |project_attachment|
  json.extract! project_attachment, :id, :attachment_id, :project_id
  json.url project_attachment_url(project_attachment, format: :json)
end
