require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :full_name => "Full Name",
        :mobile => "Mobile",
        :email => "Email",
        :password_digest => "Password Digest",
        :active => false
      ),
      User.create!(
        :name => "Name",
        :full_name => "Full Name",
        :mobile => "Mobile",
        :email => "Email",
        :password_digest => "Password Digest",
        :active => false
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
