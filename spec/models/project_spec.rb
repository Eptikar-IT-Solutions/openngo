require 'rails_helper'

RSpec.describe Project, type: :model do
    it {should validate_presence_of :name}
    it {should validate_presence_of :goal}
    it {should validate_presence_of :budget}
    it {should validate_uniqueness_of :name}

	it {should belong_to :branch }
    it { should belong_to(:location)}

	it { should have_many :project_milestones }

    it { should have_many :project_donors}
    it { should have_many(:donors).through(:project_donors) }
    it { should have_many :project_partners }
    it { should have_many(:organizations).through(:project_partners) }
    it { should have_many :project_roles }
    it { should have_many(:roles).through(:project_roles) }
    it {should validate_numericality_of :budget}
end