FactoryBot.define do
  factory :quiz_attempt do
    deck
    correct_count { 0 }
    total_count { 0 }
  end
end
