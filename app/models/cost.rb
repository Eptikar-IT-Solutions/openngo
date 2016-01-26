class Cost < ActiveRecord::Base
  has_many :lines
  has_one :activity

  validates :total_cost, presence: true

  accepts_nested_attributes_for :lines, allow_destroy: true
end
