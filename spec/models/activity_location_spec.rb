require 'rails_helper'

RSpec.describe ActivityLocation, type: :model do
  it {should belong_to :location}
  it {should belong_to :activity}
end
