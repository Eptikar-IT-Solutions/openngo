PublicActivity.enabled = false
states = {"en" => [ "Al Jazirah", "Blue Nile ", "Sennar", "White Nile", "Central Darfur", "East Darfur", "North Darfur", "South Darfur", "West Darfur", "Kassala", "Al Qadarif","Red Sea", "North Kurdufan", "South Kurdufan", "West Kurdufan", "Northern", "River Nile", "Khartoum"], "ar" =>[ "الجزيرة", "النيل الأزرق", "سنار", "النيلالأبيض", "وسط دارفور", "شرق دارفور", "شمال دارفور", "جنوب دارفور", "غرب دارفور", "كسلا", "القضارف", "البحر الأحمر", "شمال كردفان", "جنوب كردفان", "غرب كردفان", "الشمالية", "نهر النيل", "الخرطوم"]}

(0..17).each do |n|
  State.create(name: states["en"][n])
  State::Translation.create(name: states["ar"][n], state_id: State.last.id, locale: "ar")
end  


role1 = Role.create(name: 'Guest', permissions:{all: false})
role2 = Role.create(name: 'Admin', permissions:{all: true})

User.create(name: 'admin', full_name: 'Administrator', email: 'alias@example.com', password: '12345678', password_confirmation: '12345678', active: true, confirmed_at: Time.now, role_id: role2.id)

organization1 = Organization.create(name: 'United Nations Convention To Combat Desertification', website: 'www.unccd.int', subdomain: 'unccd', email: 'info@unccd.int', phone1: '+49-228815-2800', phone2: '+249912412801', fax: '0+49-228815-289899', address: 'UNCCD
Platz der Vereinten Nationen 1, D-53113 Bonn, Germany', description: 'The Convention’s 195 parties work together to improve the living conditions for people in drylands, to maintain and restore land and soil productivity, and to mitigate the effects of drought. The UNCCD is particularly committed to a bottom-up approach, encouraging the participation of local people in combating desertification and land degradation. The UNCCD secretariat facilitates cooperation between developed and developing countries, particularly around knowledge and technology transfer for sustainable land management.', active: true )

organization2 = Organization.create(name: 'The Crop Trust', website: 'www.croptrust.org', subdomain: '', email: 'info@croptrust.org', phone1: '+49 (0) 228 85427 122', phone2: '', fax: '', address: 'The Crop Trust Platz Der Vereinten Nationen 7 53113 Bonn, Germany', description: 'The mission of the Crop Trust is to ensure the conservation and availability of plant diversity essential for food and agriculture, forever', active: true)


state = State.create(name: 'Khartoum')

branch = Branch.create(name: 'Africa-sudan', description: " The Regional Implementation Annex for Africa of the UNCCD outlines an approach for addressing desertification, land degradation and drought on the African continent.  This Annex is the most detailed and comprehensive of all the regional annexes to the Convention. 
  ",  state_id: state.id )

project = Project.create(name: 'UNCCD Capacity Building Marketplace', budget: 100000, from: '2016-08-01', to: '2015-12-01', goal: 'invites communities to make their own contributions and so help to  make  this the most comprehensive marketplace of its kind in the world.', description: 'The Capacity Building Marketplace links all existing and emerging supply and demand there are relating to capacity for the meaningful implementation of the Convention, thus making for quick and easy transactions. It further invites them to make their own contributions and so help to  make  this the most comprehensive marketplace of its kind in the world.')

activity1 = Activity.create(name: 'Sustainable Urban Land Use Planning course', project_id: project.id, budget: 2000,branch_id: branch.id, description: 'This course teaches participants a functional and integrated understanding of the dynamics of urban land use to face the challenge of urbanization.
',from: '2016-08-01', to: '2016-08-20', repeated: '1')

activity2 = Activity.create(name: 'World Soil Day celebration', project_id: project.id, budget: 12000,branch_id: branch.id, description: '',from: '2016-11-24', to: '2016-11-24', repeated: '1')

profession1 = Profession.create(name: 'College Professor')

profession2 = Profession.create(name: 'Chemical Engineer')

member1 = Member.create(name: 'Ahmed Ali', gender: 0, email: 'ahmed.ali87@hotmail.com', mobile: '0024912800284', joined_at: '2013-07-10' ,profession_id: profession1.id, education: 'Master', bio: 'Zoologists who worked for a room to read organization for 6 years', active: true, branch_id: branch.id, role_id: role1.id, organization_id: organization1.id)

member2 = Member.create(name: 'Osama Abdain', gender: 0, email: 'osama.abdeen@hotmail.com', mobile: '0024912900774', joined_at: '2013-08-10' ,profession_id: profession2.id, education: 'Bachelor', active: true, branch_id: branch.id, role_id: role2.id, organization_id: organization1.id)

donor = Donor.create(name: 'Hamad Mustafa', email:'hamad_mustafa70@gmail.com', phone1: '0024914244839',phone2: '0024918044839',fax: '00240155474888')

location1 = Location.create(name: 'Khartoum', state_id: state.id)

location2 = Location.create(name: 'Friendship Hal', state_id: state.id)

location3 = Location.create(name: 'Cornithia Hotel', state_id: state.id)

ProjectMilestone.create(name: 'Crowd Fund The Hope Link OrphanageProject ', description: 'Hope Link Development Project is raising funds to organize their community in the field of sustainable agriculture, which benefits the community through recycling systems and sustainable land management, promoting food security and sustainable development.', expences: 8000, project_id: project.id)

#ProjectMilestone.create(name: 'Desertification Degerdation in North State ', description: 'By Implementing the best practices by planting in the smallest spaces ,The Problem of Desertification is declining', expences: 60000, project_id: project.id)

project_member1 = ProjectMember.create(member_id: member1.id, project_id: project.id)
 
project_member2 = ProjectMember.create(member_id: member2.id, project_id: project.id)

ProjectDonor.create(donor_id: donor.id,project_id: project.id)

activity_member1= ActivityMember.create(activity_id: activity1.id, member_id: member1.id)

activity_member2= ActivityMember.create(activity_id: activity2.id, member_id: member2.id)

Project_partner = ProjectPartner.create(project_id: project.id, organization_id: organization2.id)
PublicActivity.enabled = true