require 'rails_helper'

feature 'home page'  do
	scenario 'companies list' do
		visit('/')
		expect(page).to have_content('Company Directory App')
    end
end