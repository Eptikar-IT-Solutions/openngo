require 'rails_helper'

RSpec.describe "professions/index", type: :view do
  before(:each) do
    assign(:professions, [
      Profession.create!(
        :name => "Name"
      ),
      Profession.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of professions" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
