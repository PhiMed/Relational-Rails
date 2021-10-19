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

  get '/breweries', to: 'breweries#index'
  get '/breweries/new', to: 'breweries#new'
  post '/breweries', to: 'breweries#create'
  get '/breweries/:id', to: 'breweries#show'
  get 'breweries/:id/edit', to: 'breweries#edit'
  patch 'breweries/:id', to: 'breweries#update'
  delete '/breweries/:id', to: 'breweries#destroy'

  get '/employee', to: 'employee#index'
  get '/employee/new', to: 'employee#new'
  post '/employee', to: 'employee#create'
  get '/employee/:id', to: 'employee#show'
  get '/employee/:id/edit', to: 'employee#edit'
  patch '/employee/:id', to: 'employee#update'
  delete '/employee/:id', to: 'employee#destroy'

  get '/beers', to: 'beers#index'
  get '/beers/new', to: 'beers#new'
  post '/beers', to: 'beers#create'
  get '/beers/:id', to: 'beers#show'
  get '/beers/:id/edit', to: 'beers#edit'
  patch '/beers/:id', to: 'beers#update'
  delete '/beers/:id', to: 'beers#destroy'

  get '/restaurant/:id/employee', to: 'restaurant_employees#index'
  get '/restaurant/:id/employee/new', to: 'restaurant_employees#new'
  post '/restaurant/:id/employee', to: 'restaurant_employees#create'

  get '/breweries/:id/beers', to: 'breweries_beers#index'
  get '/breweries/:id/beers/new', to: 'breweries_beers#new'
  post '/breweries/:id/beers', to: 'breweries_beers#create'
  get '/breweries/:id/beers/alphabetize', to: 'breweries_beers#sort_alphabetically'

end
