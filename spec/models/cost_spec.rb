require 'rails_helper'

RSpec.describe Cost, type: :model do

  it { should belong_to(:activity) }
  
  it { should have_many :lines }

  it "should have totalcost equal to the sum of the expences of all lines"  do
    cost = FactoryGirl.create(:cost)
    sum = 0
    5.times do
      line = FactoryGirl.create(:line, cost_id: cost.id, price: 4.4, quantity: 2)
      sum += line.price * line.quantity
    end
    cost.reload
    expect(cost.total_cost).to eq(sum)
  end
end
