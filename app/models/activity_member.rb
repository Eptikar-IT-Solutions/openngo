class ActivityMember < ActiveRecord::Base
  belongs_to :member 
  belongs_to :activity
  belongs_to :role
end
