####################Branch################################################
rails g scaffold_controller State name:string -f

####################Location##############################################
rails g scaffold_controller Location state_id:integer name:string -f

####################Branch################################################
rails g scaffold_controller Branch name:string description:text state_id:intger -f

####################Donor#################################################
rails g scaffold_controller Donor name:string email:string phone1:string phone2:string fax:string  description:text -f

####################Role##################################################
rails g scaffold_controller Role name:string -f

####################Member################################################
rails g scaffold_controller Member name:string gender:integer joined_at:date email:string mobile:string address:string profession:integer education:integer branch_id:integer  bio:text active:boolean -f

####################Project###############################################
rails g scaffold_controller Project name:string budget:decimal from:date to:date goal:text description:text -f

####################ProjectLocation########################################
rails g scaffold_controller ProjectLocation project_id:integer location_id:integer -f

####################ProjectPartner########################################
rails g scaffold_controller ProjectPartner project_id:integer partner_id:integer -f

####################ProjectDonor##########################################
rails g scaffold_controller ProjectDonor project_id:integer donor_id:integer -f

####################ProjectMember#########################################
rails g scaffold_controller ProjectMember project_id:integer member_id:integer -f

####################Activity##############################################
rails g scaffold_controller Activity name:string project_id:integer branch_id:integer budget:decimal description:text from:datetime to:datetime repeated:integer -f

####################ActivityLocation########################################
rails g scaffold_controller ActivityLocation activity_id:integer location_id:integer -f

####################Organization##########################################
rails g scaffold_controller Organization name:string website:string subdomain:string email:string phone1:string phone2:string fax:string address:string description:text active:boolean -f

####################ActivityMember##########################################
rails g scaffold_controller ActivityMember activity_id:integer member_id:integer -f
