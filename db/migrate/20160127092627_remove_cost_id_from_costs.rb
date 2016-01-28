class RemoveCostIdFromCosts < ActiveRecord::Migration
  def change
    remove_column :costs, :cost_id, :integer
  end
end
