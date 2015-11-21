require 'rails_helper'

RSpec.describe "donors/new", type: :view do
  before(:each) do
    assign(:donor, Donor.new(
      :name => "MyString",
      :email => "MyString",
      :phone1 => "MyString",
      :phone2 => "MyString",
      :fax => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new donor form" do
    render

    assert_select "form[action=?][method=?]", donors_path, "post" do

      assert_select "input#donor_name[name=?]", "donor[name]"

      assert_select "input#donor_email[name=?]", "donor[email]"

      assert_select "input#donor_phone1[name=?]", "donor[phone1]"

      assert_select "input#donor_phone2[name=?]", "donor[phone2]"

      assert_select "input#donor_fax[name=?]", "donor[fax]"

      assert_select "textarea#donor_description[name=?]", "donor[description]"
    end
  end
end
