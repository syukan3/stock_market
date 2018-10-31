Rails.application.routes.draw do
  get 'home/top'
  devise_for :users
  resources :orders

  resources :users, only: %i(show)

  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
