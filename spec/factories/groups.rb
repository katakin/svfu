# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    name "MyString"
    faculty_id 1
    level_id 1
    deleted false
  end
end
