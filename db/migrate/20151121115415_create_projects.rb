class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.decimal :budget
      t.date :from
      t.date :to
      t.text :goal
      t.text :description

      t.timestamps null: false
    end
  end
end
