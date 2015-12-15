class AddScalePrecisionDefaultValueToProjects < ActiveRecord::Migration
  def change
    change_column :projects, :budget, :decimal, precision: 12, scale: 2, default: 0.00
    change_column :projects, :overall_expences, :decimal, precision: 12, scale: 2, default: 0.00
  end
end
