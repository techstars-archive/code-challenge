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
  company.founders << Founder.new(
    full_name: Faker::Name.name,
    title: Faker::Name.title
  )
  category1 = Category.new( name: "IoT")
  category2 = Category.new(name: "Ruby")
  founder1 = Founder.new(full_name: "Jane Doe", title: "CEO")

  company.taggings << Tagging.new(category: category1)
  company.founders << founder1
  company.save
end

p "Created #{Company.count} companies"