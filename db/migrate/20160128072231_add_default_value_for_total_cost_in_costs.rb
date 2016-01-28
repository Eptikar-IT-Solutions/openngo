class AddDefaultValueForTotalCostInCosts < ActiveRecord::Migration
  def change
    change_column :costs, :total_cost, default: 0
  end
end
