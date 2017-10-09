class FoundersController < ApplicationController

  before_action do
    @company = Company.find(params[:company_id])
  end

  def new
    @founder = Founder.new(:company_id => @company.id)
  end

  def create
    @founder = @company.founders.new(founder_params)
    if @founder.save
      redirect_to companies_path(@company.id)
    end
  end

  private

  def founder_params
    params.require(:founder).permit(:full_name, :title, :company_id).merge(:company_id => @company.id)
  end

end