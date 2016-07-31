Rails.application.routes.draw do

  post 'reactions/:video_id/create', to: 'reactions#create'


  # get 'videos/new', to: "videos#new", as: 'new_video'
  # post '/videos', to: "videos#create"
  # delete 'videos/destroy', to: "videos#destroy"
  # get 'videos/:id', to: "videos#show", as: 'video'
  # get '/videos', to: "videos#index"
  resources :videos
  resources :categories
  resources :reactions

  root to: 'pages#home'
  get '/login', to: 'pages#login', as: 'login'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/user/profile/:user_id', to: 'users#show'
  get '/user/next', to: 'users#next_video', as: 'next_video'
  post '/user/categories', to: 'users#update_categories'

  get '/follow/', to: 'users#follow', as: 'follow'
  post '/follow/', to: 'users#follow_add'
  delete '/follow/', to: 'users#follow_remove'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
