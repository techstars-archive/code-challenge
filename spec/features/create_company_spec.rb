require 'rails_helper'

feature 'create new company' do 
	scenario 'create new company with valid data' do
	    visit('/')
	    click_on('Add Company')
        
        visit new_company_path
        expect(page).to \
          have_content('Company Name')
          have_content('City')
          have_content('State')
          have_content('Founded date')
          have_content('Description')

	    fill_in('Company Name', with: 'Bitla Software Pvt. Ltd.')
	    fill_in('City', with: 'Bangalore')
	    fill_in('State', with: 'Karnataka')
	    fill_in('Founded date', with: '2007-06-29')
	    fill_in('Description', with: 'Bitla is the Technology ')
	    click_on('Create Company')

        expect(page.current_path).to eq root_path
	    expect(page).to have_content('Company has been created successfully')
	    expect(Company.last.name).to eq('Bitla Software Pvt. Ltd.')
	end

	scenario 'create new company without valid data' do
		visit('/')
		click_on('Add Company')

		visit new_company_path
		click_on('Create Company')

		expect(page).to have_content("can't be blank")
	end
end