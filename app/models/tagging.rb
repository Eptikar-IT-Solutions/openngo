class Tagging < ActiveRecord::Base

  belongs_to :tag
  belongs_to :taggable, :polymorphic => true

  before_create  :increment_counter
  before_destroy :decrement_counter

  def self.remove_new_tag_from_old_records
    includes(:tag).where(tags: { name: 'new' }, created_at: 2.hours.ago..Time.now).destroy_all
  end

  private

  def increment_counter
    Tag.increment_counter("#{self.taggable_type.downcase.pluralize}_count", self.tag_id)
  end

  def decrement_counter
    Tag.decrement_counter("#{self.taggable_type.downcase.pluralize}_count", self.tag_id)
  end
end