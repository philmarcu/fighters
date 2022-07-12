Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/fighters', to: 'fighters#index'
  get '/moves', to: 'moves#index'
  get '/moves/best_moves', to: 'moves#best'
  get '/moves/:id', to: 'moves#show'
  get '/moves/:id/edit', to: 'moves#edit'
  patch '/moves/:id', to: 'moves#update'
  get 'fighters/new', to: 'fighters#new'
  post '/fighters', to: 'fighters#create'
  get '/fighters/:id', to: 'fighters#show'
  get '/fighters/:id/edit', to: 'fighters#edit'
  patch '/fighters/:id', to: 'fighters#update'
  get '/fighters/:fighter_id/moves', to: 'fighter_moves#index'
  get '/fighters/:fighter_id/moves/new', to: 'fighter_moves#new'
  post '/fighters/:fighter_id/moves', to: 'fighter_moves#create'
end