require "rails_helper"

describe CompaniesController do
  
  describe "GET #index" do
    it "Should render the Company Index View" do

      location1 = Location.create(city: "SF", state: "CA", company_id: 1)
      location2 = Location.create(city: "Pacifica", state: "CA", company_id: 2)

      company1 = Company.create(name: "Audrey's Farm", description: "A farm full of horses.", location: location1, id: 1)
      company2 = Company.create(name: "Zoey's Zoo", description: "A zoo full of animals.", location: location2, id: 2)

      get :index
      
      expect(response).to render_template(:index)
      expect(response.status).to eq(200)
      expect(assigns(:companies)).to eq [company1, company2]
    end
  end

  describe "GET #show" do
    it "shows an individual company" do

      location1 = Location.create(city: "SF", state: "CA", company_id: 1)
      company1 = Company.create(name: "Audrey's Farm", description: "A farm full of horses", id: 1)

      get :show, id: 1

      expect(response.status).to eq(200)
      expect(response).to render_template :show
      expect(assigns(:company)).to eq company1
    end
  end

  describe "GET #new" do
    it "renders new form" do

      get :new

      expect(response.status).to eq(200)
      expect(response).to render_template :new
      expect(assigns(:company)).to be_a_new(Company)
    end
  end

  describe "POST #create" do
    it "creates new company" do

      expect {
        post :create,
          company: {name: "emmy dogpark inc", description: "a dogpark for all dogs"}
      }.to change {Company.all.count}.by(1)
      expect(response.status).to eq(302)
    end
  end

  describe "GET #edit" do
    it "allows edit of a company" do 

      location = Location.create(city: "Pacifica", state: "CA", company_id: 2)
      company = Company.create(id: 2, name: "starfleet.io", description: "We love Star Trek here.")

      get :edit, id: 2

      expect(response).to render_template :edit
      expect(response.status).to eq(200)
      expect(assigns(:company)).to eq company
    end
  end

  describe "PATCH update" do
    it "updates a company" do

      location = Location.create(city: "Pacifica", state: "CA", company_id: 2)
      company = Company.create(id: 2, name: "starfleet.io", description: "We love Star Trek here.")
        
      patch :update, id: 2, company: {name: "starfleet.io", description: "This description is updated."}

      expect(response.status).to eq(302)
      expect(response).to redirect_to company_path(2)
      expect(Company.find(2).description).to eq("This description is updated.")
    end
  end

  describe "DESTROY" do
    it "allows for deletion of a company" do

      location = Location.create(city: "Pacifica", state: "CA", company_id: 2)
      company = Company.create(name: "starfleet.io", description: "We love Star Trek here.", id: 2)

      delete :destroy, id: company.id

      expect(response.status).to eq(302)
      expect(response).to redirect_to companies_path
      expect(Company.all.count).to eq(0)   
    end
  end

end