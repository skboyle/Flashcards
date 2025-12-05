class FlashcardsController < ApplicationController
  before_action :set_deck
  before_action :set_flashcard, only: [:edit, :update, :destroy]

  def new
    @flashcard = @deck.flashcards.new
  end

  def create
    @flashcard = @deck.flashcards.new(flashcard_params)
    if @flashcard.save
      redirect_to deck_path(@deck)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flashcard.update(flashcard_params)
      redirect_to deck_path(@deck)
    else
      render :edit
    end
  end

  def destroy
    @flashcard.destroy
    redirect_to deck_path(@deck)
  end

  private

  def set_deck
    @deck = Deck.find(params[:deck_id])
  end

  def set_flashcard
    @flashcard = @deck.flashcards.find(params[:id])
  end

  def flashcard_params
    params.require(:flashcard).permit(:front, :back)
  end
end
