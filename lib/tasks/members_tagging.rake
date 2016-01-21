namespace :db do
  task :tag_members => :environment do

    tagging = {}

    Member.all.pluck(:education).compact.uniq.each do |edu_tag|
      tag = Tag.create!(name: Member.educations.key(edu_tag))
      tagging[Member.educations.key(edu_tag)] = tag.id
    end

    Member.all.each do |member|
      Tagging.create!(tag_id: tagging[member.education], taggable_id: member.id, taggable_type: "Member")
    end
  end
end