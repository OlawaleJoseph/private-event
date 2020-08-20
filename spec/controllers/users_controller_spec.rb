require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#new" do
    it "has a 200 status code" do
      get :new
      expect(response.status).to eq(200)
    end
    it "renders registration form" do
      get :new
      expect(response).to render_template("users/new")
    end
    it "creates a user instance variable" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end
end
