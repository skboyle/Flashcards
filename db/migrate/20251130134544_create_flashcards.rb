class CreateFlashcards < ActiveRecord::Migration[8.0]
  def change
    create_table :flashcards do |t|
      t.references :deck, null: false, foreign_key: true
      t.text :front
      t.text :back

      t.timestamps
    end
  end
end
