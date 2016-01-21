class AddOccupationAddressToMembers < ActiveRecord::Migration
  def change
    add_column :members, :occupation_address, :string
  end
end
