Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
namespace :api do
  namespace :v1 do
    resources :devices do
      resources :keys, only: [:index, :create, :update]
    end
  end
end
post '/devices/:id/keys', to: 'devices#create_key'
get '/devices/:id/keys', to: 'devices#list_keys' 
put '/devices/:id/keys/:key_id', to: 'devices#invalidate_key'
  # Defines the root path route ("/")
  # root "articles#index"
end
