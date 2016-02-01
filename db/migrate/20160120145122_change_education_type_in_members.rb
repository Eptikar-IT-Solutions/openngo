class ChangeEducationTypeInMembers < ActiveRecord::Migration
  def change
    if connection.adapter_name.downcase == 'postgresql'
        change_column :members, :education, 'integer USING CAST(education AS integer)'
      else
        change_column :members, :education, :integer
      end
  end
end
