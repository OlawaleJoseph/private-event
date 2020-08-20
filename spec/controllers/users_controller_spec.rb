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

  describe "#create" do
    # let(:user) { User.new({ first_name: 'wales', last_name: 'adeks', username: 'wadeks' }) }

    # it "has a 400 status code" do
    #   post :create :user
    #   puts response.body
    #   expect{:user.save}.to raise_error
    # end
  end
end
