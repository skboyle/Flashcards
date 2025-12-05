require "rails_helper"

RSpec.describe Deck, type: :model do
  subject { Deck.new(name: "My Deck", description: "A sample deck") }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is invalid without a name" do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it "can have many flashcards" do
    deck = Deck.create!(name: "Deck 1")
    deck.flashcards.create!(front: "Q1", back: "A1")
    deck.flashcards.create!(front: "Q2", back: "A2")
    expect(deck.flashcards.count).to eq(2)
  end
end
