Rails.application.routes.draw do
  get 'home/top'
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :users, only: %i(show)
  resources :issues, only: %i(index show) do
    resources :buys, only: %i(index create new update edit destroy show)
    resources :sells, only: %i(index create new update edit destroy show)
  end
  resources :stocks, only: %i(index update show)

  get "/" => "home#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
