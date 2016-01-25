require 'rails_helper'

RSpec.describe "costs/edit", type: :view do
  before(:each) do
    @cost = assign(:cost, Cost.create!(
      :total_cost => "9.99"
    ))
  end

  it "renders the edit cost form" do
    render

    assert_select "form[action=?][method=?]", cost_path(@cost), "post" do

      assert_select "input#cost_total_cost[name=?]", "cost[total_cost]"
    end
  end
end
