Rails.application.routes.draw do
  get 'home/top'
  devise_for :users

  resources :users, only: %i(show)
  resources :orders, only: %i(index create new update edit destroy show)
  resources :issues, only: %i(index show)
  resources :stocks, only: %i(index update show)


  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
