require 'rails_helper'

RSpec.describe TaskMember, type: :model do
  it { should validate_presence_of :task_id }
  it { should validate_uniqueness_of  :member_id }

  it { should belong_to :task }
  it { should belong_to :member }

  it "should validate that member with task as unique" do

  end

  it "should be invalid if its task has full members" do
    task = FactoryGirl.create(:task, maximum_members: 1)
    task.members << FactoryGirl.create(:member)
    member = FactoryGirl.create(:member)
    task_member = FactoryGirl.build(:task_member, task: task, member: member)
    expect(task_member).to be_invalid
  end

end
