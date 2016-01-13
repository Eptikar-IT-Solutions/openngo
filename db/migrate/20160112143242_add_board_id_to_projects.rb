class AddBoardIdToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :trello_board_id, :string
  end
end
