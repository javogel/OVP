Rails.application.routes.draw do

  # post 'reactions/:video_id/create', to: 'reactions#create'

  patch '/users/categories/update_all', to: 'users#update_categories'
  get 'categories/show_all', to: 'categories#show_all', as: 'category_all'


  resources :follows, only: [:index, :create]
  delete '/follows/destroy', to: 'follows#destroy'


  resources :videos, only: :none do
    get :next, on: :collection
    resources :reactions, only: [:create, :destroy]
  end
  resources :videos
  resources :categories

  resources :users, only: :show

  root to: 'pages#home'
  get '/login', to: 'pages#login', as: 'login'
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # resources :reactions
  # get '/user/profile/:user_id', to: 'users#show'
  # post '/user/categories', to: 'users#update_categories'
  #
  # resources :users, only: :show do
  #   resources :categories, only: :none do
  #     patch :update_all, on: :collection
  #   end
  # end

  # get '/user/next', to: 'users#next_video', as: 'next_video'

  # get '/follow/', to: 'users#follow', as: 'follow'
  # post '/follow/', to: 'users#follow_add'
  # delete '/follow/', to: 'users#follow_remove'

  #resources :follows, only: [:show, :create, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
