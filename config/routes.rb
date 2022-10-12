Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :books, only: [:index, :show]

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :shelves, only: %I[index]
      end
    end
  end
end
