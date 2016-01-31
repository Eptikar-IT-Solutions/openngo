require 'rails_helper'

RSpec.describe Activity, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of  :name }
  
  it { should belong_to :project }
  it { should belong_to :branch } 
  it { should belong_to(:location) }
  
  it { should have_many :activity_members }
  it { should have_many(:members).through(:activity_members) }

end
