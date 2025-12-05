class Deck < ApplicationRecord
  has_many :flashcards, dependent: :destroy
  has_many :quiz_attempts, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 1000 }, allow_blank: true
end
