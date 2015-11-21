require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :name => "MyString",
      :full_name => "MyString",
      :mobile => "MyString",
      :email => "MyString",
      :password_digest => "MyString",
      :active => false
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_name[name=?]", "user[name]"

      assert_select "input#user_full_name[name=?]", "user[full_name]"

      assert_select "input#user_mobile[name=?]", "user[mobile]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_password_digest[name=?]", "user[password_digest]"

      assert_select "input#user_active[name=?]", "user[active]"
    end
  end
end
