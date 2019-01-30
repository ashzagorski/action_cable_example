Rails.application.routes.draw do
  namespace :api do

    root "welcome#about"

    get '/messages' => 'messages#index'
    post '/messages' => 'messages#create'
    get '/messages/:id' => 'messages#show'
    patch '/messages/:id' => 'messages#update'
    delete '/messages/:id' => 'messages#destroy'

    get '/chatrooms' => 'chatrooms#index'
    post '/chatrooms' => 'chatrooms#create'
    get '/chatrooms/:id' => 'chatrooms#show'
    patch '/chatrooms/:id' => 'chatrooms#update'
    delete '/chatrooms/:id' => 'chatrooms#delete'

     get '/topics' => 'topics#index'
    post '/topics' => 'topics#create'
    get '/topics/:id' => 'topics#show'
    patch '/topics/:id' => 'topics#update'
    delete '/topics/:id' => 'topics#delete'
    
    post "/users" => "users#create"

    post "/sessions" => "sessions#create"
  end

  mount ActionCable.server => '/cable'

  resources :chatrooms
  resources :messages
end
