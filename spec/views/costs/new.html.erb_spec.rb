require 'rails_helper'

RSpec.describe "costs/new", type: :view do
  before(:each) do
    assign(:cost, Cost.new(
      :total_cost => "9.99"
    ))
  end

  it "renders new cost form" do
    render

    assert_select "form[action=?][method=?]", costs_path, "post" do

      assert_select "input#cost_total_cost[name=?]", "cost[total_cost]"
    end
  end
end
