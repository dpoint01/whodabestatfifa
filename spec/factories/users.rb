FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "generic firstname #{n}"}
    sequence(:last_name) { |n| "generic lastname #{n}"}
    sequence(:username) { |n| "generic username #{n}"}
    phone_number { 10.times.map { rand(9) }.join }
    sequence(:email) { |n| "email#{n}@example.com" }
    password "password"
  end
end
