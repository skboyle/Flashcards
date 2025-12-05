require 'rails_helper'

RSpec.describe "QuizAttempts", type: :request do
  let!(:deck) { create(:deck, :with_flashcards, flashcards_count: 3) }

  before do
    post deck_quiz_attempts_path(deck)
    @attempt = QuizAttempt.last
  end

  describe "GET /show" do
    it "returns http success" do
      get deck_quiz_attempt_path(deck, @attempt)
      expect(response).to have_http_status(:success)
    end
  end
end
