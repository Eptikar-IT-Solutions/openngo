class CreateDonors < ActiveRecord::Migration
  def change
    create_table :donors do |t|
      t.string :name
      t.string :email
      t.string :phone1
      t.string :phone2
      t.string :fax
      t.text :description

      t.timestamps null: false
    end
  end
end
