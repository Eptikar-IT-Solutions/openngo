require 'csv'
namespace :db do
  task :import_csv => :environment do
    CSV.foreach("/home/arwa/Desktop/Table1.csv", :headers => true) do |row|
    	project = row.to_hash

	    partner =Partner.find_or_create_by(name: project['Partner_id'])

	    partner['branch_id'] = branch.id	
    	Partner.create!(member)
    	puts(member)
    end
  end
end