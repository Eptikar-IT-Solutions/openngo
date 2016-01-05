class AddGlobalizeTranslationFields < ActiveRecord::Migration
  def up
    Organization.create_translation_table! name: :string, description: :text
    Donor.create_translation_table! name: :string, description: :text
    Branch.create_translation_table! name: :string, description: :text
    User.create_translation_table! full_name: :string
    Location.create_translation_table! name: :string
    Role.create_translation_table! name: :string
    Project.create_translation_table! name: :string, description: :text
    Activity.create_translation_table! name: :string, description: :text
    Profession.create_translation_table! name: :string
    ProjectMilestone.create_translation_table! name: :string, description: :text
    State.create_translation_table! name: :string
  end

  def down
    Organization.drop_translation_table!
    Donor.drop_translation_table!
    User.drop_translation_table!
    Location.drop_translation_table!
    Branch.drop_translation_table!
    Role.drop_translation_table!
    Project.drop_translation_table!
    Activity.drop_translation_table!
    Profession.drop_translation_table!
    ProjectMilestone.drop_translation_table!
    State.drop_translation_table!
  end
end
