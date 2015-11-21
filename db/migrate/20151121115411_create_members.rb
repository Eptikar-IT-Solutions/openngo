class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name
      t.integer :gender
      t.date :joined_at
      t.string :email
      t.string :mobile
      t.string :address
      t.integer :profession
      t.integer :education
      t.string :organization
      t.text :bio
      t.boolean :active

      t.timestamps null: false
    end
  end
end
