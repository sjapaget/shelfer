Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  namespace :api do
    namespace :v1 do
      resources :shelves, only: %I[index]
      resources :books, only: %I[index show create destroy]
    end
  end
end
