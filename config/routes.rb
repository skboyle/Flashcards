Rails.application.routes.draw do
  root "decks#index"

  resources :decks do
    resources :flashcards, except: [:index]
    resources :quiz_attempts, only: [:create, :show] do
      resources :quiz_attempt_scores, only: [:create]
    end
  end
end
