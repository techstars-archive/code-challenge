class FoundersController < ApplicationController

	def new
	   @company = Company.find(params[:company_id].to_i)
	   @founder = Founder.new
	end

	def create
	  @company = Company.find(params[:company_id].to_i)
	  @founder = Founder.new(founder_params)
	  @founder.company_id = params[:company_id]
	  if @founder.save
	  	redirect_to company_path(@company), flash: { success: 'Founder has been added successfully' }
	  else
	  	render :new
	  end
	end

	private

	def founder_params
	   params.require(:founder).permit(:name, :title, :company_id)
	end
end