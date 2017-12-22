Rails.application.routes.draw do
  resources :books, only: [:show]
  resources :reviews
end
