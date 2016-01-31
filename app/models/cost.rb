class Cost < ActiveRecord::Base
  has_many :lines
  belongs_to :activity

  accepts_nested_attributes_for :lines, allow_destroy: true

  after_save :update_total_cost

  private

    def update_total_cost
      cost_lines = self.lines.pluck(:price, :quantity)
      if cost_lines.any?
        self.update_attribute(:total_cost, cost_lines.inject(0) { |sum, line| sum + (line[0]*line[1]) })
      end
    end
end
