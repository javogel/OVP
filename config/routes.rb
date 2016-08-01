Rails.application.routes.draw do

  post 'reactions/:video_id/create', to: 'reactions#create'


  # get 'videos/new', to: "videos#new", as: 'new_video'
  # post '/videos', to: "videos#create"
  # delete 'videos/destroy', to: "videos#destroy"
  # get 'videos/:id', to: "videos#show", as: 'video'
  # get '/videos', to: "videos#index"

  resources :videos, only: :none do
    get :next, on: :collection
  end
  resources :videos
  resources :categories
  resources :reactions

  root to: 'pages#home'
  get '/login', to: 'pages#login', as: 'login'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'


  # get '/user/profile/:user_id', to: 'users#show'
  # post '/user/categories', to: 'users#update_categories'

  resources :users, only: :show do
    # resources :categories, only: :none do
    #   patch :update_all, on: :collection
    # end
  end
  patch '/users/categories/update_all', to: 'users#update_categories'


  # get '/user/next', to: 'users#next_video', as: 'next_video'



  resources :follows, only: [:index, :create]
  delete '/follows/destroy', to: 'follows#destroy'

  # get '/follow/', to: 'users#follow', as: 'follow'
  # post '/follow/', to: 'users#follow_add'
  # delete '/follow/', to: 'users#follow_remove'

  #resources :follows, only: [:show, :create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
