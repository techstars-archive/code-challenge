class FoundersController < ApplicationController
  def create
    @company = Company.find(params[:company_id])

    @founder = @company.founders.create(founder_params)
    redirect_to company_path(@company)
  end

  def destroy
    @company = Company.find(params[:company_id])
    @founder = @company.founders.find(params[:id])
    @founder.destroy
    redirect_to company_path(@company)
  end

  private
    def founder_params
      params.require(:founder).permit(:full_name, :title)
    end
end
