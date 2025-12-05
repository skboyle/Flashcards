require 'rails_helper'

RSpec.describe "Decks", type: :request do
  let!(:deck) { create(:deck) }

  describe "GET /index" do
    it "returns http success" do
      get decks_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get deck_path(deck)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_deck_path(deck)
      expect(response).to have_http_status(:success)
    end
  end
end
