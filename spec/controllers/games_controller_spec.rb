require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  let(:user) { create(:user) }
  let(:valid_attributes) {
    {
      user_name: user.name,
      user_choice: 'rock'
    }
  }

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Game" do
        expect {
          post :create, params: { game: valid_attributes }
        }.to change(Game, :count).by(1)
      end

      it "redirects to the created game" do
        post :create, params: { game: valid_attributes }
        expect(response).to redirect_to(Game.last)
      end
    end
  end

  describe "GET #index" do
    it "returns a success response" do
      game = create(:game, user: user)
      get :index, params: { user_name: user.name }
      expect(response).to be_successful
    end

    it "returns a success response with XHR request" do
      game = create(:game, user: user)
      get :index, params: { user_name: user.name }, xhr: true
      expect(response).to be_successful
    end
  end
end