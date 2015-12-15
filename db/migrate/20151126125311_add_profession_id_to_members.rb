class AddProfessionIdToMembers < ActiveRecord::Migration
  def change
    add_column :members, :profession_id, :integer
  end
end
