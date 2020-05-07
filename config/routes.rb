Rails.application.routes.draw do
  get 'sessions/new'
  get 'welcome/index'
  get 'signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles do
    resources :comments
  end

  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]

  namespace :api do
    resources :users, :account_activations, :password_resets, :comments, :defaults => { :format => :json }
    resources :articles, :defaults => { :format => :json } do
      resources :comments
    end
  end

  root 'welcome#index'
end
