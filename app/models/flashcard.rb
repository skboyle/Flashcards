class Flashcard < ApplicationRecord
  belongs_to :deck
  has_many :quiz_attempt_scores, dependent: :destroy

  validates :front, :back, presence: true, length: { maximum: 2000 }
  validates :deck, presence: true
end
