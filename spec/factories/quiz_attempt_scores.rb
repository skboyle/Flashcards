FactoryBot.define do
  factory :quiz_attempt_score do
    association :quiz_attempt
    association :flashcard
    correct { false }
  end
end
