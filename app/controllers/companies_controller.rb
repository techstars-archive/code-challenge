class CompaniesController < ApplicationController

	def index
	end

	def new
	  @company = Company.new
	end

	def create
	  @company = Company.new(company_params)
	  if @company.save
	  	redirect_to root_url, flash: { success: 'Company has been created successfully' }
	  else
	  	render :new
	  end
	end

	def edit
	  @company = Company.find(params[:id])
	end

	def update
	  @company = Company.find(params[:id])
	  if @company.update(company_params)
	  	redirect_to company_path(@company), flash: { success: 'Company has been updated successfully' }
	  else
	  	render :edit
	  end
	end

	def show
	  @company = Company.find(params[:id])
	end

	def destroy
	  @company = Company.find(params[:id])
	  if @company.destroy
	  	redirect_to root_url, flash: { success: 'Company has been deleted successfully' }
	  end
	end

	private

	def company_params
	  params.require(:company).permit(:name, :city, :state, :founded_date, :description)
	end

end