class ChangeEducationInMembers < ActiveRecord::Migration
  def change
     change_column :members, :education, :string
  end
end
