require 'rails_helper'

RSpec.describe "states/new", type: :view do
  before(:each) do
    assign(:state, State.new(
      :name => "MyString"
    ))
  end

  it "renders new state form" do
    render

    assert_select "form[action=?][method=?]", states_path, "post" do

      assert_select "input#state_name[name=?]", "state[name]"
    end
  end
end
