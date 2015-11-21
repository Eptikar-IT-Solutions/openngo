require 'rails_helper'

RSpec.describe "donors/edit", type: :view do
  before(:each) do
    @donor = assign(:donor, Donor.create!(
      :name => "MyString",
      :email => "MyString",
      :phone1 => "MyString",
      :phone2 => "MyString",
      :fax => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit donor form" do
    render

    assert_select "form[action=?][method=?]", donor_path(@donor), "post" do

      assert_select "input#donor_name[name=?]", "donor[name]"

      assert_select "input#donor_email[name=?]", "donor[email]"

      assert_select "input#donor_phone1[name=?]", "donor[phone1]"

      assert_select "input#donor_phone2[name=?]", "donor[phone2]"

      assert_select "input#donor_fax[name=?]", "donor[fax]"

      assert_select "textarea#donor_description[name=?]", "donor[description]"
    end
  end
end
