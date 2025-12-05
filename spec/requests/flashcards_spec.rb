require 'rails_helper'

RSpec.describe "Flashcards", type: :request do
  let!(:deck) { create(:deck) }
  let!(:flashcard) { create(:flashcard, deck: deck) }

  describe "GET /new" do
    it "returns http success" do
      get new_deck_flashcard_path(deck)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get edit_deck_flashcard_path(deck, flashcard)
      expect(response).to have_http_status(:success)
    end
  end
end
