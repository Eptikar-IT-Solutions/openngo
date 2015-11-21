require 'rails_helper'

RSpec.describe "branches/index", type: :view do
  before(:each) do
    assign(:branches, [
      Branch.create!(
        :name => "Name",
        :description => "MyText",
        :state => ""
      ),
      Branch.create!(
        :name => "Name",
        :description => "MyText",
        :state => ""
      )
    ])
  end

  it "renders a list of branches" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
