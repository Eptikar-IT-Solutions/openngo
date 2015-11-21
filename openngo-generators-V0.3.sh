####################Branch################################################
rails g scaffold State name:string

####################Location##############################################
rails g scaffold Location state_id:integer name:string

####################Branch################################################
rails g scaffold Branch name:string description:text state:intger

####################Donor#################################################
rails g scaffold Donor name:string email:string phone1:string phone2:string fax:string  description:text

####################Role##################################################
rails g scaffold Role name:string project_id:integer

####################Member################################################
rails g scaffold Member name:string gender:integer joined_at:date email:string mobile:string address:string profession:integer education:integer organization:string bio:text active:boolean

####################Project###############################################
rails g scaffold Project name:string budget:decimal from:date to:date goal:text description:text

####################ProjectLocation########################################
rails g scaffold ProjectLocation project_id:integer location_id:integer

####################ProjectPartner########################################
rails g scaffold ProjectPartner project_id:integer partner_id:integer

####################ProjectDonor##########################################
rails g scaffold ProjectDonor project_id:integer donor_id:integer

####################ProjectMember#########################################
rails g scaffold ProjectMember project_id:integer member_id:integer member_type:integer

####################Activity##############################################
rails g scaffold Activity name:string project_id:integer branch_id:integer budget:decimal description:text from:datetime to:datetime repeated:integer

####################ActivityLocation########################################
rails g scaffold ActivityLocation activity_id:integer location_id:integer

####################Organization##########################################
rails g scaffold Organization name:string website:string subdomain:string email:string phone1:string phone2:string fax:string address:string description:text active:boolean