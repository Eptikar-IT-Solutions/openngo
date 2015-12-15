require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should validate_uniqueness_of :subdomain }

  it{ should have_many :members }
end
