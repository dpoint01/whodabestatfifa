# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    sequence(:name) { |n| "generic name #{n}"}
    sequence(:location) { |n| "generic location #{n}"}
  end
end
