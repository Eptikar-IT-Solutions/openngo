module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, :as => :taggable, dependent: :destroy
    has_many :tags, :through => :taggings
    
    attr_accessor :tag_names_cache

    after_create :stamp_new_tag
    after_save :save_cached_tags
  end

  def tag(name)
    name.strip!
    tag = Tag.where(name: name).first_or_create!
    self.taggings.where(tag: tag).first_or_create!
  end

  def tag_names
    @tag_names ||= self.tags.collect(&:name).flatten.uniq.join(Tag::DELIMITER)
  end

  def tag_names=(names)
    self.tag_names_cache = names if self.new_record?
    self.taggings.destroy_all
    names.strip.split(Tag::DELIMITER).flatten.uniq.each { |name| self.tag(name) }
  end

  def stamp_new_tag
    self.tag('New') #green tag, should propably move to settings
  end
  
  def save_cached_tags
    self.tag_names = self.tag_names_cache if self.tag_names_cache
  end

  module ClassMethods
    # Adds a class method for quering with tag_list => Array of tags
    def tagged_with(tag_list)
      joins(:tags).where(tags: {name: tag_list})
    end

    def tags
      Tag.includes(:taggings).where(taggings: {taggable_type: self.name})
    end

    def new_count
      joins(:tags).where(tags: {name: 'new'}).size
    end
   end
end