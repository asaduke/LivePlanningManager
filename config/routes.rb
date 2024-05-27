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
    resources :posts, only: %i[new create show destroy]
  end
  resources :posts, only: %i[index] do
    get 'favorites', on: :collection
    resource :favorite, only: %i[create destroy]
  end
  resources :others, only: %i[show], shallow: true  do
    resources :profiles, only: %i[show edit update]
  end
end
