PublicActivity.enabled = false
role1 = Role.create(name: 'Guest', permissions:{all: false})
role1 = Role.create(name: 'Admin', permissions:{all: true})
# role2 = Role.create(name: 'Program Coordinator')
# role3 = Role.create(name: 'Treasury Secretary')

user = User.create(name: 'admin', full_name: 'Administrator', email: 'info@example.com', password: '12345678', password_confirmation: '12345678', active: true, confirmed_at: Time.now, role_id: role1.id)

state1 = State.create(name: "Al Jazirah")
state2 = State.create(name: "Blue Nile ")
state3 = State.create(name: "Sennar")
state4 = State.create(name: "White Nile")
state5 = State.create(name: "Central Darfur")
state6 = State.create(name: "East Darfur ")
state7 = State.create(name: "North Darfur ")
state8 = State.create(name: "South Darfur ")
state9 = State.create(name: "West Darfur")
state10 = State.create(name: "Kassala")
state11 = State.create(name: "Al Qadarif")
state12 = State.create(name: "Red Sea")
state13 = State.create(name: "North Kurdufan ")
state14= State.create(name: "South Kurdufan")
state15 = State.create(name: "West Kurdufan")
state16 = State.create(name: "Northern")
state17 = State.create(name: "River Nile")
state18 = State.create(name: "Khartoum")

branch1 = Branch.create(name: "Al Dammer", state_id:  state17.id)
branch2 = Branch.create(name: "Om Sedrah", state_id: state13.id)
branch3 = Branch.create(name: "Al Dender", state_id: state3.id)
branch4 = Branch.create(name: "Al Ryadh", state_id: state18.id)
branch5 = Branch.create(name: "Zalnje", state_id: state9.id )
branch6 = Branch.create(name: "Kelk", state_id: state14.id)
branch7 = Branch.create(name: "Niala", state_id: state8.id)
branch8 = Branch.create(name: "Al Barkah, East Nile", state_id: state18.id )
branch9 = Branch.create(name: "Al Byaddh", state_id: state18.id)
branch10 = Branch.create(name: "Al Jerefat and Om Doom", state_id:state18.id )
branch11 = Branch.create(name: "Aba Island", state_id: state4)
branch12 = Branch.create(name: "Al Shebelya Island", state_id: state17)
branch13 = Branch.create(name: "Kebkabya", state_id: state7.id)
branch14 = Branch.create(name: "Enviromental Information Centere", state_id: state18.id)

Organization.create(name: 'SECS', website: 'www.secs.org.sd', subdomain: '', email: 'secs.org@gmail.com's,active: true)

# Project.create(name: 'Eco Neighbouehoods Project', budget: 1908547.75, from: '2010-01-01', to: '2013-01-01', goal: 'To improve environmental management and reduce poverty in the state of Khartoum to contribute towards achieving the Millennium Development Goals (MDGs)')
# Project.create(name: 'Spreading Human and Environmental Rights', budget: 252605.93, from: '2007-01-01', to: '2010-01-01', goal: 'To spread human and environmental rights culture among sudanese communities')
# Project.create(name: 'Water and Sanitation Promotion Project', budget: 980479.0, from: '2011-01-01', to: '2011-12-01', goal: 'Provision of potable drinking water for the estimated 27,000 in two localities (Babnousa and Elsalam,South Kordofan) state  ')
# Project.create(name: 'Eco peace & Natural Resources Management', budget: 360.0, from: '2009-01-01', to: '2010-01-01 ', goal: 'Promotion of Eco peace (proactive) culture, advocates for environmental right to have access to land and to attain rational use of natural resources and to ensure sustainable livelihoods. ')
# Project.create(name: 'Community Environmental Governance Initiative (CEGI)  ', budget: 124.81 , from: '2012-01-01', to: '2012-12-01 ', goal: 'To strengthen community cohesion, ecological resilience and traditional forms of governance. ')
# Project.create(name: 'Eco peace project', budget: 449.46 , from: '2008-01-01', to: '2011-01-01', goal: 'The Eco peace program aims at promoting eco peace (proactive) culture and advocate for environmental rights to attain equitable accessibility of the natural resources and ensure sustainable livelihoods.')
# Project.create(name: 'Natural resource management and Environmental Recovery  ', budget: 790.0 , from: '2013-01-01', to: '2013-12-01', goal: 'To sustain rational resource management for sustainable peace building in the state.')
# Project.create(name: 'Environmental Forum', budget: 70.0 , from: '2004-01-01', to: '2004-12-01', goal: 'Discuss top priority environmental issues with decision makers')
# Project.create(name: 'SECS-FES Environmental Program', budget: 1056.89 , from: '2004-01-01', to: '2004-12-01', goal: 'Raise environmental awareness of different stakeholders')
# Project.create(name: 'SECS-DED Development Program', budget: 1484.0 , from: '2004-01-01', to: '2004-12-01', goal: 'Building of SECS branches capacity')


# Platz der Vereinten Nationen 1, D-53113 Bonn, Germany', description: 'The Convention’s 195 parties work together to improve the living conditions for people in drylands, to maintain and restore land and soil productivity, and to mitigate the effects of drought. The UNCCD is particularly committed to a bottom-up approach, encouraging the participation of local people in combating desertification and land degradation. The UNCCD secretariat facilitates cooperation between developed and developing countries, particularly around knowledge and technology transfer for sustainable land management.', active: true )

# organization2 = Organization.create(name: 'The Crop Trust', website: 'www.croptrust.org', subdomain: '', email: 'info@croptrust.org', phone1: '+49 (0) 228 85427 122', phone2: '', fax: '', address: 'The Crop Trust Platz Der Vereinten Nationen 7 53113 Bonn, Germany', description: 'The mission of the Crop Trust is to ensure the conservation and availability of plant diversity essential for food and agriculture, forever', active: true)


# state = State.create(name: 'Khartoum')

# branch = Branch.create(name: 'Africa-sudan', description: " The Regional Implementation Annex for Africa of the UNCCD outlines an approach for addressing desertification, land degradation and drought on the African continent.  This Annex is the most detailed and comprehensive of all the regional annexes to the Convention. 
#   ",  state_id: state.id )

# project = Project.create(name: 'UNCCD Capacity Building Marketplace', budget: 100000, from: '2016-08-01', to: '2015-12-01', goal: 'invites communities to make their own contributions and so help to  make  this the most comprehensive marketplace of its kind in the world.', description: 'The Capacity Building Marketplace links all existing and emerging supply and demand there are relating to capacity for the meaningful implementation of the Convention, thus making for quick and easy transactions. It further invites them to make their own contributions and so help to  make  this the most comprehensive marketplace of its kind in the world.')

# activity1 = Activity.create(name: 'Sustainable Urban Land Use Planning course', project_id: project.id, budget: 2000,branch_id: branch.id, description: 'This course teaches participants a functional and integrated understanding of the dynamics of urban land use to face the challenge of urbanization.
# ',from: '2016-08-01', to: '2016-08-20', repeated: '1')

# activity2 = Activity.create(name: 'World Soil Day celebration', project_id: project.id, budget: 12000,branch_id: branch.id, description: '',from: '2016-11-24', to: '2016-11-24', repeated: '1')

profession1 = Profession.create(name: 'other')

# profession2 = Profession.create(name: 'Chemical Engineer')

# member1 = Member.create(name: 'Ahmed Ali', gender: 0, email: 'ahmed.ali87@hotmail.com', mobile: '0024912800284', joined_at: '2013-07-10' ,profession_id: profession1.id, education: 'Master degree in zoology', bio: 'Zoologists who worked for a room to read organization for 6 years', active: true, branch_id: branch.id, role_id: role1.id, organization_id: organization1.id)

# member2 = Member.create(name: 'Osama Abdain', gender: 0, email: 'osama.abdeen@hotmail.com', mobile: '0024912900774', joined_at: '2013-08-10' ,profession_id: profession2.id, education: 'Avid enviroment activist who worked on in this area in many Kenya and South Africa', active: true, branch_id: branch.id, role_id: role2.id, organization_id: organization1.id)

# donor = Donor.create(name: 'Hamad Mustafa', email:'hamad_mustafa70@gmail.com', phone1: '0024914244839',phone2: '0024918044839',fax: '00240155474888')

# location1 = Location.create(name: 'Khartoum', state_id: state.id)

# location2 = Location.create(name: 'Friendship Hal', state_id: state.id)

# location3 = Location.create(name: 'Cornithia Hotel', state_id: state.id)

# ProjectMilestone.create(name: 'Crowd Fund The Hope Link OrphanageProject ', description: 'Hope Link Development Project is raising funds to organize their community in the field of sustainable agriculture, which benefits the community through recycling systems and sustainable land management, promoting food security and sustainable development.', expences: 8000, project_id: project.id)

# #ProjectMilestone.create(name: 'Desertification Degerdation in North State ', description: 'By Implementing the best practices by planting in the smallest spaces ,The Problem of Desertification is declining', expences: 60000, project_id: project.id)

# project_member1 = ProjectMember.create(member_id: member1.id, project_id: project.id)
 
# project_member2 = ProjectMember.create(member_id: member2.id, project_id: project.id)

# ProjectDonor.create(donor_id: donor.id,project_id: project.id)

# activity_location1 = ActivityLocation.create(activity_id: activity1.id, location_id: location2.id)

# activity_location2 = ActivityLocation.create(activity_id: activity1.id, location_id: location3.id)

# Project_location= ProjectLocation.create(project_id: project.id, location_id:location1.id)

# activity_member1= ActivityMember.create(activity_id: activity1.id, member_id: member1.id)

# activity_member2= ActivityMember.create(activity_id: activity2.id, member_id: member2.id)

# Project_partner = ProjectPartner.create(project_id: project.id, organization_id: organization2.id)
PublicActivity.enabled = true