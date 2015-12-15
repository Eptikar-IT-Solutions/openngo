class CreatePublicActivities < ActiveRecord::Migration
 def self.up
    create_table :public_activities do |t|
      t.belongs_to :trackable, :polymorphic => true
      t.belongs_to :owner, :polymorphic => true
      t.string  :key
      t.text    :parameters
      t.belongs_to :recipient, :polymorphic => true

      t.timestamps
    end

    add_index :public_activities, [:trackable_id, :trackable_type]
    add_index :public_activities, [:owner_id, :owner_type]
    add_index :public_activities, [:recipient_id, :recipient_type]
  end
  # Drop table
  def self.down
    drop_table :public_activities
  end
end
