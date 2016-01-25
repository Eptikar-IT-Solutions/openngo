require 'rails_helper'

RSpec.describe "costs/show", type: :view do
  before(:each) do
    @cost = assign(:cost, Cost.create!(
      :total_cost => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
  end
end
