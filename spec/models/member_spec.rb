require 'rails_helper'

RSpec.describe Member, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email}
  it { should validate_presence_of :mobile }
  it { should validate_presence_of :organization }
  it { should validate_uniqueness_of  :name }

  it {should belong_to :branch}
  it {should belong_to :organization}
  it {should belong_to :role}

  it { should have_many :activity_members }
  it { should have_many(:activities).through(:activity_members) }
  it { should have_many :project_members }
  it { should have_many(:projects).through(:project_members) }
end
