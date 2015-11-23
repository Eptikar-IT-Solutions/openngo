require 'rails_helper'

RSpec.describe "activity_members/show", type: :view do
  before(:each) do
    @activity_member = assign(:activity_member, ActivityMember.create!(
      :activity_id => 1,
      :member_id => 2,
      :role_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
