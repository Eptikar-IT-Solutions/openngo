class RemoveRenewalStringFromMembers < ActiveRecord::Migration
  def change
    remove_column :members, :renewal_string, :string
  end
end
