require 'rails_helper'

RSpec.describe "members/show", type: :view do
  before(:each) do
    @member = assign(:member, Member.create!(
      :name => "Name",
      :gender => 1,
      :email => "Email",
      :mobile => "Mobile",
      :address => "Address",
      :profession => 2,
      :education => 3,
      :organization => "Organization",
      :bio => "MyText",
      :active => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Organization/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/false/)
  end
end
