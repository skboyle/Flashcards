FactoryBot.define do
  factory :flashcard do
    deck
    front { "Front text" }
    back { "Back text" }
  end
end
