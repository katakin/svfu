# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :schedule do
    parity 1
    occupation "MyString"
    teacher_id 1
    pair_id 1
    room_id 1
    subject_id 1
    weekday_id 1
    group_id 1
    deleted false
  end
end
