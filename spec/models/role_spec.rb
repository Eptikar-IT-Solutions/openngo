require 'rails_helper'

RSpec.describe Role, type: :model do
  it{should belong_to :project}
end
