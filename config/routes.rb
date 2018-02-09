Rails.application.routes.draw do
  get 'books/show'

  resources :books, only: [:show]
end
