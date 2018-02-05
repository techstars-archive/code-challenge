require 'rails_helper'

describe CompaniesController do
  describe "GET #index" do
  	it "lists out the companies" do 
  	  company1 = FactoryGirl.create(:company)
  	  company2 = FactoryGirl.create(:company)
  	  company3 = FactoryGirl.create(:company)

  	  get :index

  	  expect(response).to render_template :index 
      expect(response.status).to eq(200)
      expect(assigns(:companies)).to eq [company1, company2, company3]
  	end
  end


  describe "GET #new" do 
  	it "renders :new template" do 
  	  get :new
  	  
  	  expect(response).to render_template(:new)
  	end
  	it "sets new Company to @company" do 
  	  get :new

  	  expect(response.status).to eq(200)
  	  expect(assigns(:company)).to be_instance_of(Company)
  	  expect(assigns(:company)).to be_new_record
  	end
  end 

  describe "POST #create" do
     context "with valid attributes" do 
     	it "creates new company" do 
     	  
    	  expect{ post :create, params: { company: { name: "Bitla Software Pvt. Ltd.", city: "Bangalore", state: "Karnataka", founded_date: "2007-06-29", description: "Bitla is the Technology provider for Hotel, Travel domains" } } }.to change {Company.count}.by(1)
     	  expect(response).to redirect_to root_path
     	  expect(response.status).to eq(302)
     	  expect(flash[:success]).to be_present 
     	end
     end 

     context "with invalid attributes" do 
     	it "doesn't create company" do
     	 expect{ post :create, params: { company: { city: "Bangalore", state: "Karnataka", founded_date: "2007-06-29", description: "Bitla is the Technology provider for Hotel, Travel domains" } } }.to change {Company.count}.by(0)
     	  expect(response).to render_template :new 
     	  expect(response.status).to eq(200)
     	end
     end
  end

  describe "GET #edit" do 
  	let(:company) { FactoryGirl.create(:company) }
  	it "renders :edit template" do 
  	  get :edit, params: { id: company.id }

  	  expect(response.status).to eq(200)
  	  expect(response).to render_template(:edit)
  	end
  	it "sets the requested company to @company" do 
  	  get :edit, params: { id: company.id }

  	  expect(response.status).to eq(200)
  	  expect(assigns(:company)).to eq(company)
  	end
  end

  describe "PATCH #update" do
  	let(:company) { FactoryGirl.create(:company) }
  	context "with valid attributes" do 
     	it "updates the company" do 
     	  
    	 patch :update, params: { id: company.id, company: { name: "Techstars", city: "Bangalore", state: "Karnataka", founded_date: "2007-06-29", description: "Enterprenuers" } } 

     	  expect(response).to redirect_to company_path(company.id)
     	  expect(response.status).to eq(302)
     	  expect(Company.find(company.id).name).to eq("Techstars")
     	  expect(flash[:success]).to be_present 
     	end
     end 

     context "with invalid attributes" do 
     	it "doesn't update company" do
     	 patch :update, params: { id: company.id, company: { name: "", city: "Bangalore", state: "Karnataka", founded_date: "2007-06-29", description: "Enterprenuers" } }

     	  expect(response).to render_template :edit 
     	  expect(response.status).to eq(200)
     	end
     end
  end

  describe "GET #show" do 
  	let(:company) { FactoryGirl.create(:company) }
  	it "renders :show template" do 
  	  get :show, params: { id: company.id }

  	  expect(response.status).to eq(200)
  	  expect(response).to render_template(:show)
  	end
  	it "sets the requested company to @company" do 
  	  get :show, params: { id: company.id }

  	  expect(response.status).to eq(200)
  	  expect(assigns(:company)).to eq(company)
  	end
  end

  describe "DELETE #destroy" do
  	 let(:company) { FactoryGirl.create(:company) }
  	 it "deletes the company" do
  	   delete :destroy, params: { id: company.id }

  	   expect(Company.count).to eq(0)
  	   expect(response).to redirect_to root_path
  	   expect(flash[:success]).to be_present 
  	 end
  end 

end