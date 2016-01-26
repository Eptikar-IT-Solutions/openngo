class AddCostIdToActivityDToCosts < ActiveRecord::Migration
  def change
    add_column :costs, :cost_id, :integer
  end
end
