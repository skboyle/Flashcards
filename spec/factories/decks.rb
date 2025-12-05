FactoryBot.define do
  factory :deck do
    sequence(:name) { |n| "Deck #{n}" }
    description { "This is a test deck" }

    trait :with_flashcards do
      transient do
        flashcards_count { 5 }
      end

      after(:create) do |deck, evaluator|
        create_list(:flashcard, evaluator.flashcards_count, deck: deck)
      end
    end
  end
end
