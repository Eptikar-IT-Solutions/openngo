class AddPrecisionScaleToTotalCostToCosts < ActiveRecord::Migration
  def change
    change_column :costs, :total_cost, :decimal, precision: 7, scale: 2, default: 0
  end
end
