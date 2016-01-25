require 'rails_helper'

RSpec.describe "lines/new", type: :view do
  before(:each) do
    assign(:line, Line.new(
      :name => "MyString",
      :quantity => 1,
      :cost => "9.99"
    ))
  end

  it "renders new line form" do
    render

    assert_select "form[action=?][method=?]", lines_path, "post" do

      assert_select "input#line_name[name=?]", "line[name]"

      assert_select "input#line_quantity[name=?]", "line[quantity]"

      assert_select "input#line_cost[name=?]", "line[cost]"
    end
  end
end
