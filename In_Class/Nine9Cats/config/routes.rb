Rails.application.routes.draw do
  resources :cats
  resources :users

  resource :session
end
