# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :teacher do
    fio "MyString"
    faculty_id 1
    subject_id 1
    deleted false
  end
end
