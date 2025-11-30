require 'rails_helper'

RSpec.describe "Decks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/decks/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/decks/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/decks/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/decks/edit"
      expect(response).to have_http_status(:success)
    end
  end

end
