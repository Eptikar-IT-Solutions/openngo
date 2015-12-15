require 'rails_helper'

RSpec.describe ProjectMilestone, type: :model do
  it{ should belong_to :project}
end
