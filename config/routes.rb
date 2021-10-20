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

  get '/breweries', to: 'breweries#index'
  get '/breweries/new', to: 'breweries#new'
  post '/breweries', to: 'breweries#create'
  get '/breweries/:id', to: 'breweries#show'
  get 'breweries/:id/edit', to: 'breweries#edit'
  patch 'breweries/:id', to: 'breweries#update'
  delete '/breweries/:id', to: 'breweries#destroy'

  get '/employees', to: 'employees#index'
  get '/employees/new', to: 'employees#new'
  post '/employees', to: 'employees#create'
  get '/employees/:id', to: 'employees#show'
  get '/employees/:id/edit', to: 'employees#edit'
  patch '/employees/:id', to: 'employees#update'
  delete '/employees/:id', to: 'employees#destroy'

  get '/beers', to: 'beers#index'
  get '/beers/new', to: 'beers#new'
  post '/beers', to: 'beers#create'
  get '/beers/:id', to: 'beers#show'
  get '/beers/:id/edit', to: 'beers#edit'
  patch '/beers/:id', to: 'beers#update'
  delete '/beers/:id', to: 'beers#destroy'

  get '/restaurants/:id/employees', to: 'restaurant_employees#index'
  get '/restaurants/:id/employees/new', to: 'restaurant_employees#new'
  post '/restaurants/:id/employees', to: 'restaurant_employees#create'
  delete '/restaurants/:id/employees', to: 'restaurant_employees#destroy'

  get '/breweries/:id/beers', to: 'breweries_beers#index'
  get '/breweries/:id/beers/new', to: 'breweries_beers#new'
  post '/breweries/:id/beers', to: 'breweries_beers#create'
end
