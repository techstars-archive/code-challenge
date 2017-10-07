require "rails_helper"

describe CompaniesController do
  describe "GET #index" do
    it "Should render the Company Index View" do

      get :index
      
      expect(response).to render_template(:index)
    end
  end
end