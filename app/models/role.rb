class Role < ActiveRecord::Base
  has_many :members
  has_many :project_roles
end
