class CompaniesController < ApplicationController

	def index
	end

	def new
	  @company = Company.new
	end

	def create
	  @company = Company.new(company_params)
	  if @company.save
	  	redirect_to root_url, notice: 'Company has been created successfully'
	  end
	end

	private

	def company_params
	  params.require(:company).permit(:name, :city, :state, :founded_date, :description)
	end

end