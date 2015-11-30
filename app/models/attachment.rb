class Attachment < ActiveRecord::Base
  has_many :project_attachments
  has_many :projects, through: :project_attachments
  has_attached_file :file, styles: { medium: "300x300>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :file, content_type: ["application/pdf", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"]
end
