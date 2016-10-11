Rails.application.routes.draw do
  resources :cats
  resources :users

  resource :session

  root to: "cats#index"
end
