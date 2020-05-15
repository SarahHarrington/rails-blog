Rails.application.routes.draw do
  namespace :api do
    resources :users, :comments, :sessions, :defaults => { :format => :json }
    resources :articles, :defaults => { :format => :json } do
      resources :comments
    end
  end
end
