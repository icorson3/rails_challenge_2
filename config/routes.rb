Rails.application.routes.draw do
  resources :users, shallow: true do
    resources :books, only: [:show]
  end
end
