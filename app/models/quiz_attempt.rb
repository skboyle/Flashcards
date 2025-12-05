class QuizAttempt < ApplicationRecord
  belongs_to :deck
  has_many :quiz_attempt_scores, dependent: :destroy

  validates :deck, presence: true
  validates :correct_count, :total_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
end
