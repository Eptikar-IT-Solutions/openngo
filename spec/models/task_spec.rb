require 'rails_helper'

RSpec.describe Task, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :maximum_members}


  it { should belong_to :activity }

  it { should have_many :task_members }
  it { should have_many(:members).through(:task_members) }
  
  it "should create a checklist item in activity card" do

  end

end
