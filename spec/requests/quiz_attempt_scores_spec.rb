require 'rails_helper'

RSpec.describe "QuizAttemptScores", type: :request do
  let!(:deck) { create(:deck, :with_flashcards, flashcards_count: 3) }
  let!(:flashcard) { deck.flashcards.first }

  before do
    post deck_quiz_attempts_path(deck)
    @attempt = QuizAttempt.last
  end

  describe "POST /create" do
    context "when marking 'Got it'" do
      it "creates a correct QuizAttemptScore and updates totals" do
        post deck_quiz_attempt_quiz_attempt_scores_path(deck, @attempt),
             params: { flashcard_id: flashcard.id, status: "got_it" }

        expect(response).to redirect_to(deck_quiz_attempt_path(deck, @attempt))

        @attempt.reload
        score = @attempt.quiz_attempt_scores.last
        expect(score.correct).to be true
        expect(@attempt.correct_count).to eq(1)
        expect(@attempt.total_count).to eq(1)
      end
    end

    context "when marking 'Needs practice'" do
      it "creates an incorrect QuizAttemptScore and updates totals" do
        post deck_quiz_attempt_quiz_attempt_scores_path(deck, @attempt),
             params: { flashcard_id: flashcard.id, status: "needs_practice" }

        expect(response).to redirect_to(deck_quiz_attempt_path(deck, @attempt))

        @attempt.reload
        score = @attempt.quiz_attempt_scores.last
        expect(score.correct).to be false
        expect(@attempt.correct_count).to eq(0)
        expect(@attempt.total_count).to eq(1)
      end
    end
  end
end
