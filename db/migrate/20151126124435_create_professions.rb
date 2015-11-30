class CreateProfessions < ActiveRecord::Migration
  def change
    create_table :professions do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
