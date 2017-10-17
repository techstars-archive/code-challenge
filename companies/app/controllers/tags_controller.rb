class TagsController < ApplicationController
  def create
    @company = Company.find(params[:company_id])

    @tag = @company.tags.create(tag_params)
    redirect_to company_path(@company)
  end

  def destroy
    @company = Company.find(params[:company_id])
    @tag = @company.tags.find(params[:id])
    @tag.destroy
    redirect_to company_path(@company)
  end

  private
    def tag_params
      params.require(:tag).permit(:text)
    end
end
