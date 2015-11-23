require 'rails_helper'

RSpec.describe ProjectMember, type: :model do
  it{should belong_to :project}
  it{should belong_to :member}
  it{should belong_to :role}
end
