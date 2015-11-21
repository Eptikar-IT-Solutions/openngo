require 'rails_helper'

RSpec.describe "organizations/index", type: :view do
  before(:each) do
    assign(:organizations, [
      Organization.create!(
        :name => "Name",
        :website => "Website",
        :subdomain => "Subdomain",
        :email => "Email",
        :phone1 => "Phone1",
        :phone2 => "Phone2",
        :fax => "Fax",
        :address => "Address",
        :description => "MyText",
        :active => false
      ),
      Organization.create!(
        :name => "Name",
        :website => "Website",
        :subdomain => "Subdomain",
        :email => "Email",
        :phone1 => "Phone1",
        :phone2 => "Phone2",
        :fax => "Fax",
        :address => "Address",
        :description => "MyText",
        :active => false
      )
    ])
  end

  it "renders a list of organizations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Website".to_s, :count => 2
    assert_select "tr>td", :text => "Subdomain".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone1".to_s, :count => 2
    assert_select "tr>td", :text => "Phone2".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
