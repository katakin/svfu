# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    name "MyString"
    building_id 1
    deleted false
  end
end
