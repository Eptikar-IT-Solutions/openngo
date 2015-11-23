class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :full_name
      t.string :mobile
      t.string :email
      t.string :password_digest
      t.boolean :active

      t.timestamps null: true
    end
  end
end
