require 'rails_helper'

RSpec.describe Project, type: :model do
    it {should validate_presence_of :name}
    it {should validate_presence_of :goal}
    it {should validate_presence_of :budget}
    it {should validate_uniqueness_of :name}

	it {should belong_to :branch }
	
    it { should have_many :project_locations }
    it { should have_many(:locations).through(:project_locations) }
    it { should have_many :project_donors}
    it { should have_many(:donors).through(:project_donors) }
    it { should have_many :project_partners }
    it { should have_many(:partners).through(:project_partners) }
    it{should validate_numericality_of :budget}
end
