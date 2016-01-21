class AddRenewalDateToMembers < ActiveRecord::Migration
  def change
    add_column :members, :renewal_date, :date
  end
end
