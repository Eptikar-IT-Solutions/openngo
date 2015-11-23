require 'rails_helper'

RSpec.describe "members/edit", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      :name => "MyString",
      :gender => 1,
      :email => "MyString",
      :mobile => "MyString",
      :address => "MyString",
      :profession => 1,
      :education => 1,
      :branch_id => 1,
      :role_id => 1,
      :bio => "MyText",
      :active => false
    ))
  end

  it "renders the edit member form" do
    render

    assert_select "form[action=?][method=?]", member_path(@member), "post" do

      assert_select "input#member_name[name=?]", "member[name]"

      assert_select "input#member_gender[name=?]", "member[gender]"

      assert_select "input#member_email[name=?]", "member[email]"

      assert_select "input#member_mobile[name=?]", "member[mobile]"

      assert_select "input#member_address[name=?]", "member[address]"

      assert_select "input#member_profession[name=?]", "member[profession]"

      assert_select "input#member_education[name=?]", "member[education]"

      assert_select "input#member_branch_id[name=?]", "member[branch_id]"

      assert_select "input#member_role_id[name=?]", "member[role_id]"

      assert_select "textarea#member_bio[name=?]", "member[bio]"

      assert_select "input#member_active[name=?]", "member[active]"
    end
  end
end
