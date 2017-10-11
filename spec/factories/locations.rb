require 'faker'

FactoryGirl.define do
  factory :location do
    city    Faker::Address.city
    state   Faker::Address.state
  end
end
