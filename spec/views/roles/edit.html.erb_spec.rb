require 'rails_helper'

RSpec.describe "roles/edit", type: :view do
  before(:each) do
    @role = assign(:role, Role.create!(
      :name => "MyString",
      :project_id => 1
    ))
  end

  it "renders the edit role form" do
    render

    assert_select "form[action=?][method=?]", role_path(@role), "post" do

      assert_select "input#role_name[name=?]", "role[name]"

      assert_select "input#role_project_id[name=?]", "role[project_id]"
    end
  end
end
