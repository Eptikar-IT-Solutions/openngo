require 'rails_helper'

RSpec.describe "branches/new", type: :view do
  before(:each) do
    assign(:branch, Branch.new(
      :name => "MyString",
      :description => "MyText",
      :state_id => ""
    ))
  end

  it "renders new branch form" do
    render

    assert_select "form[action=?][method=?]", branches_path, "post" do

      assert_select "input#branch_name[name=?]", "branch[name]"

      assert_select "textarea#branch_description[name=?]", "branch[description]"

      assert_select "input#branch_state_id[name=?]", "branch[state_id]"
    end
  end
end
