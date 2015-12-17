class AddOverallExpencesToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :overall_expences, :decimal
  end
end