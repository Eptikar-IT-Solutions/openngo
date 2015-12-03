FactoryGirl.define do
  factory :project_milestone do
    sequence(:name){|n| "MyString#{n}" }
    description "MyText"
    expences "9.99"
    project_id 1
  end

end
