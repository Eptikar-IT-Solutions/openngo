class ProjectRole < ActiveRecord::Base
  belongs_to :role
  belongs_to :project
  belongs_to :member
end
