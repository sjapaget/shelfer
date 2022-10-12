Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :books, only: [:index, :show]

  resources :shelves, only: %I[index]
end
