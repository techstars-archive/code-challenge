require 'rails_helper'

describe FoundersController do

  describe "GET #new" do
    let(:company) { FactoryGirl.create(:company) } 
    it "renders :new template" do 
      get :new, params: { company_id: company.id } 

      expect(response).to render_template(:new)
    end
    it "sets new founder to @company" do 
      get :new, params: { company_id: company.id }

      expect(response.status).to eq(200)
      expect(assigns(:founder)).to be_instance_of(Founder)
      expect(assigns(:founder)).to be_new_record
    end
  end 

  describe "POST #create" do
     context "with valid attributes" do 
     let(:company) { FactoryGirl.create(:company) } 
      it "adds new founder to a company" do 
        
        expect{ post :create, params: { company_id: company.id, founder: { name: "Devendra Pratap Singh", title: "Founder", company_id: company.id } } }.to change {Founder.count}.by(1)
        expect(response).to redirect_to company_path(company)
        expect(response.status).to eq(302)
        expect(flash[:success]).to be_present 
      end
     end 

     context "with invalid attributes" do 
      let(:company) { FactoryGirl.create(:company) } 
      it "doesn't add company" do
       expect{ post :create, params: { company_id: company.id, founder: { title: "Founder", company_id: company.id } } }.to change {Founder.count}.by(0)
        expect(response).to render_template :new 
        expect(response.status).to eq(200)
      end
     end
  end

end