class Tag < ActiveRecord::Base
  DELIMITER = ','
  
  has_many :taggings

  has_many :projects, through: :taggings, source: :taggable, source_type: Project
  has_many :members, through: :taggings, source: :taggable, source_type: Member
    
end
