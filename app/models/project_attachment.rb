class ProjectAttachment < ActiveRecord::Base 
  belongs_to :project

  has_attached_file :file, styles: { medium: "300x300>"}, default_url: "/images/:style/missing.png"
  #validates_attachment_content_type :attachment, content_type: ["application/pdf", "application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document", "text/plain"]
end
