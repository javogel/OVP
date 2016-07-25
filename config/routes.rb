Rails.application.routes.draw do

  # get 'videos/new', to: "videos#new", as: 'new_video'
  # post '/videos', to: "videos#create"
  # delete 'videos/destroy', to: "videos#destroy"
  # get 'videos/:id', to: "videos#show", as: 'video'
  # get '/videos', to: "videos#index"
  resources :videos

  root to: 'pages#home'

  get '/login', to: 'pages#login', as: 'login'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
