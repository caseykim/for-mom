require 'factory_girl'

FactoryGirl.define do
  factory :bday_message do
    sequence(:name) { |n| "Mr./Ms. #{n}" }
    sequence(:body) { |n| "Happy Birthday!! #{n} time(s)" }
    password "0000"
  end
end
