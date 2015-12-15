require 'rails_helper'

RSpec.describe State, type: :model do  
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it {should have_many :locations}
end
