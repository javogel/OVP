Rails.application.routes.draw do

  get 'videos/new'

  get 'videos/create'

  get 'videos/destroy'

  get 'videos/show'

  get 'videos/index'

root to: 'pages#home'

get '/auth/:provider/callback', to: 'sessions#create'
delete '/logout', to: 'sessions#destroy'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
