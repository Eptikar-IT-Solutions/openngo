FactoryGirl.define do
  factory :organization do
    sequence(:name) { |n| "Test Organization#{n}" }
	website "MyString"
	sequence(:subdomain) { |n| "o#{n}.example.com" }
	email "MyString"
	phone1 "MyString"
	phone2 "MyString"
	fax "MyString"
	address "MyString"
	description "MyText"
	active false
  end

end
