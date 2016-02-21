FactoryGirl.define do
  factory :activity do
    name "MyString"
    project_id 1
    branch_id 1
    budget "9.99"
    description "MyText"
    from "2015-11-21 14:55:01"
    to "2015-11-21 14:55:01"
    repeated true
  end

end
