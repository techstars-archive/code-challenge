require 'rails_helper'

feature 'edit company page' do
	scenario 'edit company page with valid data' do
		company = FactoryGirl.create(:company)
        visit("/companies/#{company.id}")
        click_on('Edit')

        visit edit_company_path(company)
        expect(page).to \
          have_content("Editing #{company.name}")
          have_content('Company Name')
          have_content('City')
          have_content('State')
          have_content('Founded date')
          have_content('Description')
        expect(find('input[type="text"][name*="name"]').value).to have_content("#{company.name}")
        expect(find('input[type="text"][name*="city"]').value).to have_content("#{company.city}")
        expect(find('input[type="text"][name*="state"]').value).to have_content("#{company.state}")
        expect(find('input[type="text"][name*="founded_date"]').value).to have_content("#{company.founded_date}")
        expect(find('textarea[name*="description"]').value).to have_content("#{company.description}")
        expect(find('input[type="text"][name*="category_list"]').value).to have_content("#{company.category_list}")

        fill_in('Company Name', with: 'Bitla Software Pvt. Ltd.')
	    fill_in('City', with: 'Bangalore')
	    fill_in('State', with: 'Karnataka')
	    fill_in('Founded date', with: '2007-06-29')
	    fill_in('Description', with: 'Bitla is the Technology ')
	    click_on('Update Company')

	    expect(page.current_path).to eq company_path(company)
	    expect(page).to have_content('Company has been updated successfully')
	    expect(Company.find(company.id).name).to eq('Bitla Software Pvt. Ltd.')

	end

	scenario 'update company without valid data' do
		company = FactoryGirl.create(:company)
        visit("/companies/#{company.id}")
        click_on('Edit')

        visit edit_company_path(company)
        fill_in('Company Name', with: '')
	    fill_in('City', with: '')
	    fill_in('State', with: '')
	    fill_in('Founded date', with: '')
	    fill_in('Description', with: '')
		click_on('Update Company')

		expect(page).to have_content("can't be blank")
	end
    
   
end