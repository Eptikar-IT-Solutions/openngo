class Role < ActiveRecord::Base
  has_many :users
  has_many :members
  has_many :project_roles

  serialize :permissions, Hash
end
