require 'rails_helper'

RSpec.describe "donors/index", type: :view do
  before(:each) do
    assign(:donors, [
      Donor.create!(
        :name => "Name",
        :email => "Email",
        :phone1 => "Phone1",
        :phone2 => "Phone2",
        :fax => "Fax",
        :description => "MyText"
      ),
      Donor.create!(
        :name => "Name",
        :email => "Email",
        :phone1 => "Phone1",
        :phone2 => "Phone2",
        :fax => "Fax",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of donors" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone1".to_s, :count => 2
    assert_select "tr>td", :text => "Phone2".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
