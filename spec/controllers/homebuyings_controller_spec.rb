require 'rails_helper'
require 'spec_helper'

RSpec.describe HomebuyingsController, type: :controller do

  include Devise::TestHelpers

  describe "index #GET" do
    it "assigns an array of Homebuyings" do
      homebuying1 = create(:homebuying)
      homebuying2 = create(:homebuying)
      homebuying3 = create(:homebuying)
      get :index
      expect(assigns(:homebuyings)).to match_array([
        homebuying1,
        homebuying2,
        homebuying3,
      ])
    end

    it "renders index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "new #GET" do
    it "assigns a homebuying instance" do
      get :new
      expect(assigns(:homebuying)).to be_a_new(Homebuying)
    end

    it "renders new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "create #GET" do
    describe "properly assigns id based on users status" do
      before :each do
        @some_client = create(:client)
        @some_other_client = create(:client)
        @some_user = create(:user)
      end
      context "current_client logged in" do
        before :each do
          sign_in @some_client
        end
        it "assigns an id equal to the currently logged in clients id" do
          post :create
          expect(assigns(:id)).to eq @some_client.id
        end
      end

      context "current_user logged in" do
        before :each do
          sign_in @some_user
        end
        it "assigns a client id based on the id param" do
          post :create, id: @some_other_client.id
          expect(assigns(:id)).to eq @some_other_client.id
        end
      end
    end

    context "neither user or client logged in" do
      it "doesnt assign id if no user or client is logged in" do
        post :create
        expect(assigns(:id)).to eq nil
      end
    end

    describe "creates a new homebuying instance and assigns it to homebuying" do
      it "assigns a homebuying instance" do
        get :create
        expect(assigns(:homebuying)).to be_a_new(Homebuying)
      end
    end

    describe "it attempts to save the homebuying instance" do
      context "saves successfully" do
        before :each do
          @this_client = create(:client)
          sign_in @this_client
        end
        it "creates a new programemployee" do
          expect{
            post :create, attributes_for(:homebuying)
          }.to change(ProgramEmployee, :count).by(1)
        end
        it "updates the flash hash with succuss message" do
          post :create, attributes_for(:homebuying)
          expect(flash[:success]).to be_present
        end
        it "redirects to the client status page" do
          post :create, attributes_for(:homebuying)
          expect(response).to redirect_to("/clients/#{@this_client.id}/status")
        end
      end

      context "fails to save" do
        before :each do
          @this_client = create(:client)
          sign_in @this_client
          Homebuying.any_instance.stub(save: false)
          Homebuying.any_instance.stub_chain(:errors, :full_messages).and_return(["danger"])
        end
        it "updates the flash message to danger" do
          post :create, attributes_for(:homebuying)
          expect(flash[:danger]).to be_present
        end
        it "renders the NEW template" do
          post :create, attributes_for(:homebuying)
          expect(response).to render_template :new
        end
      end
    end
  end
end
