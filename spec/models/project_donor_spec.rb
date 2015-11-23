require 'rails_helper'

RSpec.describe ProjectDonor, type: :model do
  it{should belong_to :project}
  it{should belong_to :donor}
end
