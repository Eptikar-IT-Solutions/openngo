class Role < ActiveRecord::Base
  has_many :members
end
