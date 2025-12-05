require "rails_helper"

RSpec.describe QuizAttempt, type: :model do
  let(:deck) { Deck.create!(name: "Deck 1") }
  subject { QuizAttempt.new(deck: deck, correct_count: 0, total_count: 0) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "correct_count and total_count cannot be negative" do
    subject.correct_count = -1
    expect(subject).not_to be_valid
    subject.correct_count = 0
    subject.total_count = -1
    expect(subject).not_to be_valid
  end
end
