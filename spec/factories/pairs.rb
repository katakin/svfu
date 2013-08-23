# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pair do
    name 1
    duration "MyString"
    deleted false
  end
end
