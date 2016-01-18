class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.references :tag, index: true
      t.references :taggable, polymorphic: true, index: true
      
      t.timestamps null: true
    end
  end
end