Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/fighters', to: 'fighters#index'
  get 'fighters/new', to: 'fighters#new'
  post '/fighters', to: 'fighters#create'
  get '/moves', to: 'moves#index'
  get '/fighters/:id', to: 'fighters#show'
  get '/moves/:id', to: 'moves#show'
  get '/fighters/:fighter_id/moves', to: 'fighter_moves#index'
end