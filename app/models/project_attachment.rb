class ProjectAttachment < ActiveRecord::Base
  belongs_to :attachment 
  belongs_to :project
end
