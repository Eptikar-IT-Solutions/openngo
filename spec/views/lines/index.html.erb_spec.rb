require 'rails_helper'

RSpec.describe "lines/index", type: :view do
  before(:each) do
    assign(:lines, [
      Line.create!(
        :name => "Name",
        :quantity => 1,
        :cost => "9.99"
      ),
      Line.create!(
        :name => "Name",
        :quantity => 1,
        :cost => "9.99"
      )
    ])
  end

  it "renders a list of lines" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
