require 'rails_helper'

RSpec.describe BudgetsController, type: :controller do
  include Devise::TestHelpers
  # describe "GET #index" do
  #   before :each do
  #     request.env['devise.mapping'] = Devise.mappings[:user]
  #     login_with_client nil
  #   end

  #   it "returns http success" do
  #     # login_with_client create( :user)
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #new" do
  #   it "returns http success" do
  #     get :new
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #create" do
  #   it "returns http success" do
  #     get :create
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "PATCH #update" do
  #   before :each do
  #     # request.env['devise.mapping'] = Devise.mappings[:user]
  #     login_with_client nil
  #   end
  #   it "updates gross wages" do
  #     # budget = Budget.new
  #     # binding.pry
  #     # client = create(:client)
  #     budget = create(:budget, client_id: client.id)
      
  #     form_params = {
  #         "gross_wages"=>"15000.0"  
  #     }
  #     patch :update
  #     # binding.pry
  #     budget = Budget.all.last
  #     expect(budget["gross_wages"]).to eq("15000.0")
  #     # expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  # describe "GET #destroy" do
  #   it "returns http success" do
  #     get :destroy
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
