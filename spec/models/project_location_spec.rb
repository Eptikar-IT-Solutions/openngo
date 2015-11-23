require 'rails_helper'

RSpec.describe ProjectLocation, type: :model do
  it{should belong_to :project}
  it{should belong_to :location}
end
