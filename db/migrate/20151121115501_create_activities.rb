class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.integer :project_id
      t.integer :branch_id
      t.decimal :budget
      t.text :description
      t.datetime :from
      t.datetime :to
      t.integer :repeated

      t.timestamps null: true
    end
  end
end
