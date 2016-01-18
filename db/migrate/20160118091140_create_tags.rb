class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :color_code
      t.integer :projects_count
      t.integer :members_count
      t.integer :importers_count
    end
  end
end
