require 'rails_helper'

RSpec.describe "professions/new", type: :view do
  before(:each) do
    assign(:profession, Profession.new(
      :name => "MyString"
    ))
  end

  it "renders new profession form" do
    render

    assert_select "form[action=?][method=?]", professions_path, "post" do

      assert_select "input#profession_name[name=?]", "profession[name]"
    end
  end
end
