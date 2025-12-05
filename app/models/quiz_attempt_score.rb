class QuizAttemptScore < ApplicationRecord
  belongs_to :quiz_attempt
  belongs_to :flashcard

  validates :quiz_attempt, :flashcard, presence: true
  validates :correct, inclusion: { in: [ true, false ] }
  validates :flashcard_id, uniqueness: { scope: :quiz_attempt_id }
end
