Company.destroy_all

10.times do
  company = Company.new(
    name:         Faker::Company.name,
    description:   Faker::Lorem.paragraph(40),
    founded_date: Faker::Time.between(2.days.ago, Date.today, :all)
  )
  company.location = Location.new(
    state: Faker::Address.state,
    city:  Faker::Address.city
  ) 
  company.save
end

p "Created #{Company.count} companies"