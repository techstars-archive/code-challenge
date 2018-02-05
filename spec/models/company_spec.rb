require 'rails_helper'

describe Company do
  
   it { should validate_presence_of(:name) }
   it { should validate_presence_of(:city) }
   it { should validate_presence_of(:state) }
   it { should validate_presence_of(:founded_date) }
   it { should validate_presence_of(:description) }

   it "saves itself" do
  	 company = Company.new(name: "Bitla Software Pvt. Ltd.", city: "Bangalore", state: "Karnataka", founded_date: "2007-06-29", description: "Bitla is the Technology provider for Hotel, Travel domains")
  	 company.save
  	 expect(Company.first).to eq(company)
   end

   it { should have_many(:founders) }
   it { should have_many(:taggings) }
   it { should have_many(:categories).through(:taggings) }

end
