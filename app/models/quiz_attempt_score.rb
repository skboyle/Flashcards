class QuizAttemptScore < ApplicationRecord
  belongs_to :quiz_attempt
  belongs_to :flashcard
end
