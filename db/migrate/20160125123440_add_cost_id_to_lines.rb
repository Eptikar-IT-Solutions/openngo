class AddCostIdToLines < ActiveRecord::Migration
  def change
    add_column :lines, :cost_id, :integer
  end
end
