class QuizAttemptsController < ApplicationController
  before_action :set_deck

  def create
    @attempt = @deck.quiz_attempts.create(correct_count: 0, total_count: 0)
    session[:attempt_id] = @attempt.id
    session[:flashcard_ids] = @deck.flashcards.pluck(:id)
    session[:index] = 0
    redirect_to deck_quiz_attempt_path(@deck, @attempt)
  end

  def show
    @attempt = QuizAttempt.find(params[:id])
    @flashcards = @deck.flashcards
    @current_index = session[:index] || 0

    if @current_index >= @flashcards.length
      flash[:notice] = "Deck complete!"
      redirect_to deck_path(@deck)
    else
      @flashcard = @flashcards[@current_index]
    end
  end

  private

  def set_deck
    @deck = Deck.find(params[:deck_id])
  end
end
