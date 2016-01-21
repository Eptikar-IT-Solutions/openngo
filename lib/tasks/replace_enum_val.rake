namespace :db do
  task :replace_like => :environment do
    Member.all.each do |member|
      educations = {"Secondary"=>0, "Bachelor"=>1, "Master"=>2, "Diploma"=>3, "Doctorate"=>4, "Undergraduate"=>5} 
      if ["Bachelor", "Master", "Undergraduate", "Diploma", "Secondary"].include?(member.education)
        puts "member.education"
        member.update_attribute(:education, educations[member.education])
      end
    end                
  end
end    