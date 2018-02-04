require 'faker'

FactoryGirl.define do
  factory :company do
    name { Faker::Company.name }
    city { Faker::Address.city }
    state { Faker::Address.state }
    founded_date { Faker::Date.between(2.days.ago, Date.today) }
    description { Faker::Lorem.paragraph }
  end
end
