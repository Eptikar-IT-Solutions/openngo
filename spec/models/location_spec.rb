require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should belong_to :state }
  it { should have_many :projects }
  it { should have_many :activities }
end