require 'rails_helper'

feature 'company page' do 
    scenario 'company public page' do 
        company = FactoryGirl.create(:company)
        visit("/companies/#{company.id}")

        expect(page).to have_content("#{company.name}")
        expect(page).to have_content("#{company.city}")
        expect(page).to have_content("#{company.state}")
        expect(page).to have_content("#{company.founded_date.strftime('%B %d, %Y')}")
        expect(page).to have_content("#{company.description}")
        expect(page).to have_content("#{company.category_list}")
        expect(page).to have_content("Edit")
        expect(page).to have_content("Delete")
    end

    scenario 'delete company page' do 
        company = FactoryGirl.create(:company)
        visit("/companies/#{company.id}")
        
        expect { click_link('Delete') }.to change(Company, :count).by(-1)
        expect(page).to have_content('Company has been deleted successfully')
    end
end
