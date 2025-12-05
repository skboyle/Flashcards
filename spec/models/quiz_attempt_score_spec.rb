require "rails_helper"

RSpec.describe QuizAttemptScore, type: :model do
  let(:deck) { Deck.create!(name: "Deck 1") }
  let(:flashcard) { deck.flashcards.create!(front: "Q1", back: "A1") }
  let(:attempt) { deck.quiz_attempts.create!(correct_count: 0, total_count: 0) }

  subject { QuizAttemptScore.new(quiz_attempt: attempt, flashcard: flashcard, correct: true) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "validates boolean correct" do
    subject.correct = nil
    expect(subject).not_to be_valid
  end

  it "cannot have duplicate flashcard per attempt" do
    subject.save!
    duplicate = QuizAttemptScore.new(quiz_attempt: attempt, flashcard: flashcard, correct: false)
    expect(duplicate).not_to be_valid
  end
end
