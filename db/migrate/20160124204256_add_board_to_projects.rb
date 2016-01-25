class AddBoardToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :board, :string
  end
end
