require "spec_helper"
require "cancan/matchers"

describe User do
  #Roles
  let!(:admin_role) { FactoryGirl.create(:role, name: 'admin',permissions: {all: true} ) }
  let!(:intern_role) { FactoryGirl.create(:role, name: 'intern', permissions: {all: false} ) }
  let!(:program_coordinater_role) { FactoryGirl.create(:role, name: 'program coordinater', permissions: 
      {
        all: false,
        projects: { manage: true, read: true },
        activities: { manage: false, read: true, write: false, delete: false },
      } 
    ) 
  }
  #Users
  let(:admin) { FactoryGirl.create(:user, role_id: admin_role.id ) }
  let(:intern) { FactoryGirl.create(:user, name: 'intern', role_id:  intern_role.id) }
  let(:program_coordinater) { FactoryGirl.create(:user, name: 'program coordinater', role_id: program_coordinater_role.id ) 
  }

  it "should have a valid factory" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  describe "User Autherization with Permissionable & Cancan Abilities" do
    subject(:ability){ Ability.new(user) }
    let(:user){ nil }

    context "when is a super user" do
      let(:user){ admin }

      it "should treated as admin" do
        expect(user.is_admin?).to eq true
      end

      it "should be able to read everything" do
        should be_able_to(:read, :all)
      end

      it "should be able to manage everything" do
        should be_able_to(:manage, :all)
      end

      it "should not be able to destroy User" do
        should_not be_able_to(:destroy, User)
      end  

      it "should allow to edit his own profile" do
        should be_able_to(:write, admin)
      end

      it "should allow super user to edit any user profile" do
        should be_able_to(:write, User)
      end
    end
  end     
end