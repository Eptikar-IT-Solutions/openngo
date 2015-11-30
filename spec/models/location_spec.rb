require 'rails_helper'

RSpec.describe Location, type: :model do
  it {should belong_to :state}
	it {should have_many :project_locations}
  it { should have_many(:projects).through(:project_locations) }
	it {should have_many :activity_locations}
  it { should have_many(:activities).through(:activity_locations) }
end