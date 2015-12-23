require 'rails_helper'
require "cancan/matchers"

RSpec.describe User, type: :model do
  describe "User" do
    describe "abilities" do
      subject(:ability){ Ability.new(user) }
      let(:user){ nil }

      context "when is an account manager" do
        let(:user){ Factory(:accounts_manager) }

        it{ should be_able_to(:manage, Account.new) }
      end
    end
  end
end
