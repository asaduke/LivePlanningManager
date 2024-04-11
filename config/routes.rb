Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  root "tops#top"

  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"

  resources :users, only: %i[new create]
  resources :password_resets, only: %i[new create edit update]
  resources :lives do
    resources :packing_items, only: %i[new create edit update destroy], shallow: true do
      member do
        patch :toggle
      end
    end
  end
  resources :others, only: %i[show], shallow: true  do
    resources :profiles, only: %i[show edit update]
  end
  resources :posts, only: %i[indx new create show destroy]
end
