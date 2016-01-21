require 'csv'
namespace :db do
  task :import_csv => :environment do
  Member.all.each do |member|
    if member.education
      puts member.education
      tag = Tag.create(name: member.education)
      Tagging = Tagging.create(tag_id: tag.id, taggable_id: member.id, taggable_type: "Member")
      end  
    end
  end
end