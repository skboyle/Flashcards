class CreateQuizAttemptScores < ActiveRecord::Migration[8.0]
  def change
    create_table :quiz_attempt_scores do |t|
      t.references :quiz_attempt, null: false, foreign_key: true
      t.references :flashcard, null: false, foreign_key: true
      t.boolean :correct

      t.timestamps
    end
  end
end
