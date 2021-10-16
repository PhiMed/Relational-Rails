Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to:'welcome#index'

  get '/restaurant', to: 'restaurant#index'
  get '/restaurant/new', to: 'restaurant#new'
  post '/restaurant', to: 'restaurant#create'
  get '/restaurant/:id', to: 'restaurant#show'
  get '/restaurant/:id/edit', to: 'restaurant#edit'
  patch '/restaurant/:id', to: 'restaurant#update'
  delete '/restaurant/:id', to: 'restaurant#destroy'

  get '/brewery', to: 'brewery#index'
  get '/brewery/new', to: 'brewery#new'
  post '/brewery', to: 'brewery#create'
  get '/brewery/:id', to: 'brewery#show'

  get '/employee', to: 'employee#index'
  get '/employee/new', to: 'employee#new'
  post '/employee', to: 'employee#create'
  get '/employee/:id', to: 'employee#show'
  get '/employee/:id/edit', to: 'employee#edit'
  patch '/employee/:id', to: 'employee#update'

  get '/beer', to: 'beer#index'
  get '/beer/new', to: 'beer#new'
  post '/beer', to: 'beer#create'
  get '/beer/:id', to: 'beer#show'

  get '/restaurant/:id/employee', to: 'restaurant_employees#index'
  get '/restaurant/:id/employee/new', to: 'restaurant_employees#new'
  post '/restaurant/:id/employee', to: 'restaurant_employees#create'

  get '/brewery/:id/beer', to: 'brewery_beers#index'
end
