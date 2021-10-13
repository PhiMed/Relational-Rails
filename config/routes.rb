Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to:'welcome#index'

  get '/restaurant', to: 'restaurant#index'
  get '/restaurant/new', to: 'restaurant#new'
  post '/restaurant', to: 'restaurant#create'
  get '/restaurant/:id', to: 'restaurant#show'

  get '/brewery', to: 'brewery#index'
  get '/brewery/new', to: 'brewery#new'
  post '/brewery', to: 'brewery#create'
  get '/brewery/:id', to: 'brewery#show'

  

end
