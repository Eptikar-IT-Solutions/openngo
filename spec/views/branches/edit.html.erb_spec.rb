require 'rails_helper'

RSpec.describe "branches/edit", type: :view do
  before(:each) do
    @branch = assign(:branch, Branch.create!(
      :name => "MyString",
      :description => "MyText",
      :state_id => ""
    ))
  end

  it "renders the edit branch form" do
    render

    assert_select "form[action=?][method=?]", branch_path(@branch), "post" do

      assert_select "input#branch_name[name=?]", "branch[name]"

      assert_select "textarea#branch_description[name=?]", "branch[description]"

      assert_select "input#branch_state_id[name=?]", "branch[state_id]"
    end
  end
end
