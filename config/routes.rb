Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  namespace :api do
    namespace :v1 do
      resources :shelves, only: %I[index show create destroy]
      resources :books, only: %I[index show create update destroy]
    end
  end
end
