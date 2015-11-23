require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        :name => "Name",
        :gender => 1,
        :email => "Email",
        :mobile => "Mobile",
        :address => "Address",
        :profession => 2,
        :education => 3,
        :branch_id => 4,
        :role_id => 5,
        :bio => "MyText",
        :active => false
      ),
      Member.create!(
        :name => "Name",
        :gender => 1,
        :email => "Email",
        :mobile => "Mobile",
        :address => "Address",
        :profession => 2,
        :education => 3,
        :branch_id => 4,
        :role_id => 5,
        :bio => "MyText",
        :active => false
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
