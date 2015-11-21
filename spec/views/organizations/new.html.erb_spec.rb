require 'rails_helper'

RSpec.describe "organizations/new", type: :view do
  before(:each) do
    assign(:organization, Organization.new(
      :name => "MyString",
      :website => "MyString",
      :subdomain => "MyString",
      :email => "MyString",
      :phone1 => "MyString",
      :phone2 => "MyString",
      :fax => "MyString",
      :address => "MyString",
      :description => "MyText",
      :active => false
    ))
  end

  it "renders new organization form" do
    render

    assert_select "form[action=?][method=?]", organizations_path, "post" do

      assert_select "input#organization_name[name=?]", "organization[name]"

      assert_select "input#organization_website[name=?]", "organization[website]"

      assert_select "input#organization_subdomain[name=?]", "organization[subdomain]"

      assert_select "input#organization_email[name=?]", "organization[email]"

      assert_select "input#organization_phone1[name=?]", "organization[phone1]"

      assert_select "input#organization_phone2[name=?]", "organization[phone2]"

      assert_select "input#organization_fax[name=?]", "organization[fax]"

      assert_select "input#organization_address[name=?]", "organization[address]"

      assert_select "textarea#organization_description[name=?]", "organization[description]"

      assert_select "input#organization_active[name=?]", "organization[active]"
    end
  end
end
