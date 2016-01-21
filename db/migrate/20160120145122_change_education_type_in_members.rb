class ChangeEducationTypeInMembers < ActiveRecord::Migration
  def change
     change_column :members, :education, :integer
  end
end
