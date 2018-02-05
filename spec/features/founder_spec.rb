require 'rails_helper'

feature 'founder of a company' do 
	scenario 'show founder on a company page' do
		company = FactoryGirl.create(:company)
		founder = FactoryGirl.create(:founder, company_id: company.id)
        visit("/companies/#{company.id}")

        expect(page).to have_content('Founder')
        expect(page).to have_content('Add Founder')
        expect(page).to have_content("#{founder.name}")
        expect(page).to have_content("#{founder.title}")
	end

	scenario 'add founder to a particular company' do 
		company = FactoryGirl.create(:company)
		founder = FactoryGirl.create(:founder, company_id: company.id)
        visit("/companies/#{company.id}/founders/new")

        expect(page).to \
           have_content("#{company.name}")
           have_content("#{company.city}")
           have_content("#{company.state}")
           have_content("#{company.founded_date.strftime('%B %d, %Y')}")
           have_content("#{company.description}")
           have_content('Founder Name')
           have_content('Title')

        fill_in('Founder Name', with: 'David Brow')
	    fill_in('Title', with: 'Founder')
	    click_on('Add Founder')

	    expect(page.current_path).to eq company_path(company)
	    expect(page).to have_content('Founder has been added successfully')
	    expect(Founder.last.name).to eq('David Brow')
	end

	scenario 'add new founder without valid data' do
		company = FactoryGirl.create(:company)
		founder = FactoryGirl.create(:founder, company_id: company.id)
        visit("/companies/#{company.id}/founders/new")

		click_on('Add Founder')

		expect(page).to have_content("can't be blank")
	end
end