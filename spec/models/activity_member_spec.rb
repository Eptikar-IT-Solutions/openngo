require 'rails_helper'

RSpec.describe ActivityMember, type: :model do
  it{should belong_to :activity}
  it{should belong_to :member}
end
