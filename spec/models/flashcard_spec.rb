require "rails_helper"

RSpec.describe Flashcard, type: :model do
  let(:deck) { Deck.create!(name: "Deck 1") }
  subject { Flashcard.new(deck: deck, front: "Question?", back: "Answer!") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without front or back" do
    subject.front = nil
    expect(subject).not_to be_valid

    subject.front = "Q"
    subject.back = nil
    expect(subject).not_to be_valid
  end

  it "belongs to a deck" do
    expect(subject.deck).to eq(deck)
  end
end
