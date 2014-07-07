# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "generic firstname #{n}"}
    sequence(:last_name) { |n| "generic lastname #{n}"}
    sequence(:username) { |n| "generic username #{n}"}
    sequence(:phone_number) { |n| "123456789#{n}"}
    sequence(:email) { |n| "email#{n}@example.com" }
    password "password123"
  end
end
