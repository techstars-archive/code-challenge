require 'faker'

FactoryGirl.define do
  factory :founder do
    name { Faker::Name.name }
    title { Faker::Name.title }
  end
end
