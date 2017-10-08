class FoundersController < ApplicationController

  def new
    @founder = Founder.new
  end

  def create
    @founder = Founder.new(founder_params)
    if @founder.save
      redirect_to companies_path(@company)
  end

  private

  def founder_params
    params.require(:founder).permit(:full_name, :title, :company_id)
  end

end