class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :website
      t.string :subdomain
      t.string :email
      t.string :phone1
      t.string :phone2
      t.string :fax
      t.string :address
      t.text :description
      t.boolean :active

      t.timestamps null: true
    end
  end
end
