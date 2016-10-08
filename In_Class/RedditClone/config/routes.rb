Rails.application.routes.draw do
  resources :users
  resource :session

  resources :posts, except: [:index]
  resources :subs
end
