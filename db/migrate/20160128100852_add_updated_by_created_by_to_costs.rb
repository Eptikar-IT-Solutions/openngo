class AddUpdatedByCreatedByToCosts < ActiveRecord::Migration
  def change
    add_column :costs, :updated_by, :integer
    add_column :costs, :created_by, :integer
  end
end
