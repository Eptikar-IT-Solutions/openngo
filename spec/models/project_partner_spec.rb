require 'rails_helper'

RSpec.describe ProjectPartner, type: :model do
  it{should belong_to :project }
  it{should belong_to :organization }
end
