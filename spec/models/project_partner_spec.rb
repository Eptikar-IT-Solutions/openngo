require 'rails_helper'

RSpec.describe ProjectPartner, type: :model do
  it{should belong_to :project }
end
