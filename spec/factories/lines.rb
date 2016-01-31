FactoryGirl.define do
  factory :line do
    sequence(:name){|n| "MyString#{n}" }
    quantity 1
    cost "9.99"
  end

end
