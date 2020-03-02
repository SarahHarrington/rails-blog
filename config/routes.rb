Rails.application.routes.draw do
  get 'welcome/index'
  get 'signup', to: 'users#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :articles do
    resources :comments
  end

  resources :users

  root 'welcome#index'
end
