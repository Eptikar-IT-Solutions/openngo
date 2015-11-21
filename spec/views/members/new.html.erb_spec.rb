require 'rails_helper'

RSpec.describe "members/new", type: :view do
  before(:each) do
    assign(:member, Member.new(
      :name => "MyString",
      :gender => 1,
      :email => "MyString",
      :mobile => "MyString",
      :address => "MyString",
      :profession => 1,
      :education => 1,
      :organization => "MyString",
      :bio => "MyText",
      :active => false
    ))
  end

  it "renders new member form" do
    render

    assert_select "form[action=?][method=?]", members_path, "post" do

      assert_select "input#member_name[name=?]", "member[name]"

      assert_select "input#member_gender[name=?]", "member[gender]"

      assert_select "input#member_email[name=?]", "member[email]"

      assert_select "input#member_mobile[name=?]", "member[mobile]"

      assert_select "input#member_address[name=?]", "member[address]"

      assert_select "input#member_profession[name=?]", "member[profession]"

      assert_select "input#member_education[name=?]", "member[education]"

      assert_select "input#member_organization[name=?]", "member[organization]"

      assert_select "textarea#member_bio[name=?]", "member[bio]"

      assert_select "input#member_active[name=?]", "member[active]"
    end
  end
end
