require 'rails_helper'

RSpec.describe Donor, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :email }
  it { should validate_presence_of :phone1 }
  it { should validate_uniqueness_of  :name }

  it{should have_many :project_donors}
  it { should have_many(:projects).through(:project_donors) }

end
