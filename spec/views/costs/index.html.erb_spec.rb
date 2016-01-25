require 'rails_helper'

RSpec.describe "costs/index", type: :view do
  before(:each) do
    assign(:costs, [
      Cost.create!(
        :total_cost => "9.99"
      ),
      Cost.create!(
        :total_cost => "9.99"
      )
    ])
  end

  it "renders a list of costs" do
    render
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
