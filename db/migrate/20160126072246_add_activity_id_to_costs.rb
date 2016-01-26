class AddActivityIdToCosts < ActiveRecord::Migration
  def change
    add_column :costs, :activity_id, :integer
  end
end
