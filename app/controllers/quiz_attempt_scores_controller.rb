class QuizAttemptScoresController < ApplicationController
  before_action :set_attempt
  before_action :set_flashcard

  def create
    correct = params[:status] == "got_it"

    QuizAttemptScore.create!(
      quiz_attempt: @attempt,
      flashcard: @flashcard,
      correct: correct
    )

    @attempt.update(
      correct_count: @attempt.quiz_attempt_scores.where(correct: true).count,
      total_count: @attempt.quiz_attempt_scores.count
    )

    session[:index] ||= 0
    session[:index] += 1
    redirect_to deck_quiz_attempt_path(@attempt.deck, @attempt)
  end

  private

  def set_attempt
    @attempt = QuizAttempt.find(params[:quiz_attempt_id])
  end

  def set_flashcard
    @flashcard = Flashcard.find(params[:flashcard_id])
  end
end
