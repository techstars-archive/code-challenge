require 'rails_helper'

describe Founder do
  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:title) }

  it "should validate uniqueness of founder name" do
  	  company = FactoryGirl.create(:company)
	  founder1 = FactoryGirl.create(:founder, company_id: company.id)
	  founder2 = FactoryGirl.build(:founder)
	  expect { founder2.save! }.to raise_error(
	    ActiveRecord::RecordInvalid
	  )      
  end

  it { should belong_to(:company) }

end
