require 'faker'

FactoryGirl.define do
  factory :founder do
    full_name   Faker::Name.name 
    title       Faker::Name.title
  end
end