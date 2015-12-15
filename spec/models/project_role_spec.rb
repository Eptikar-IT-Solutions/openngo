require 'rails_helper'

RSpec.describe ProjectRole, type: :model do
  it{should belong_to :role}
  it{should belong_to :project}
  it{should belong_to :member}
end
