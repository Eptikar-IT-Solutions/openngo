class AddSpecializationToMembers < ActiveRecord::Migration
  def change
    add_column :members, :specialization, :string
  end
end
