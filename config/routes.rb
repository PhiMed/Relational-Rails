Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to:'welcome#index'

  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/new', to: 'restaurants#new'
  post '/restaurants', to: 'restaurants#create'
  get '/restaurants/:id', to: 'restaurants#show'
  get '/restaurants/:id/edit', to: 'restaurants#edit'
  patch '/restaurants/:id', to: 'restaurants#update'
  delete '/restaurants/:id', to: 'restaurants#destroy'

  get '/brewery', to: 'brewery#index'
  get '/brewery/new', to: 'brewery#new'
  post '/brewery', to: 'brewery#create'
  get '/brewery/:id', to: 'brewery#show'

  get '/employees', to: 'employees#index'
  get '/employees/new', to: 'employees#new'
  post '/employees', to: 'employees#create'
  get '/employees/:id', to: 'employees#show'
  get '/employees/:id/edit', to: 'employees#edit'
  patch '/employees/:id', to: 'employees#update'
  delete '/employees/:id', to: 'employees#destroy'

  get '/beer', to: 'beer#index'
  get '/beer/new', to: 'beer#new'
  post '/beer', to: 'beer#create'
  get '/beer/:id', to: 'beer#show'

  get '/restaurants/:id/employees', to: 'restaurant_employees#index', as: "restaurants_employees"
  get '/restaurants/:id/employees/new', to: 'restaurant_employees#new'
  post '/restaurants/:id/employees', to: 'restaurant_employees#create'
  delete '/restaurants/:id/employees', to: 'restaurant_employees#destroy'

  get '/brewery/:id/beer', to: 'brewery_beers#index'
end
