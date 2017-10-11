require 'faker'

FactoryGirl.define do
  factory :company do
    name          Faker::Company.name
    description   Faker::Lorem.paragraph(2)
    founded_date  Faker::Date
  end
end