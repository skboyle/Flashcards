class CreateQuizAttempts < ActiveRecord::Migration[8.0]
  def change
    create_table :quiz_attempts do |t|
      t.references :deck, null: false, foreign_key: true
      t.integer :correct_count
      t.integer :total_count

      t.timestamps
    end
  end
end
