require 'rails_helper'

RSpec.describe Member, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :mobile }
  it { should validate_uniqueness_of  :name }

  it {should belong_to :branch}
  it {should belong_to :organization}

  it {should have_one :user}

  it { should have_many :activity_members }
  it { should have_many(:activities).through(:activity_members) }
  it { should have_many :project_members }
  it { should have_many(:projects).through(:project_members) }

  let(:profession) { FactoryGirl.create :profession }

  it "should save a valid member" do
    member = FactoryGirl.create(:member, email: 'info@example.com', profession: profession)
    expect(member.save!).to be true
  end

  describe "user creation" do
    let(:member) { FactoryGirl.create(:member) }

    it "should create a user when created" do
      expect(member.user).to_not be nil
    end

    it "should give created user role of memeber" do
      expect(member.user.role.name).to eq "Member"
    end

    it "should give created user role permissions" do
      expect(member.user.role.permissions).to eq({members: {read: true}, branches: {read: true}})
    end

  end

end
