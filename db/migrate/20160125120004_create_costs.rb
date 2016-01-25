class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.decimal :total_cost

      t.timestamps null: false
    end
  end
end
