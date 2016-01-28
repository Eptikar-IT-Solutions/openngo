class Cost < ActiveRecord::Base
  has_many :lines
  belongs_to :activity

  accepts_nested_attributes_for :lines, allow_destroy: true

end
