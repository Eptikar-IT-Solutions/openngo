class ChangeCostColumnNameInLines < ActiveRecord::Migration
  def change
    rename_column :lines, :cost, :price
  end
end
