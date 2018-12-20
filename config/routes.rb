Rails.application.routes.draw do
  namespace :api do
    
    post "/users" => "users#create"

    post "/sessions" => "sessions#create"
  end

  mount ActionCable.server => '/cable'

  resources :chatrooms, param: :slug
  resources :messages
end
