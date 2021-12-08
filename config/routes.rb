Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new'
  get '/cities/:id', to: 'cities#show'
  post '/cities', to: 'cities#create'
  get '/cities/:id/edit', to: 'cities#edit'
  patch '/cities/:id', to: 'cities#update'
  delete '/cities/:id', to: 'cities#destroy'

  get '/cities/:city_id/hostels', to: 'city_hostels#index'

  get '/cities/:city_id/hostels/new', to: 'city_hostels#new'
  post '/hostels', to: 'city_hostels#create'

  get '/hostels', to: 'hostels#index'
  get '/hostels/:id', to: 'hostels#show'
  get '/hostels/:id/edit', to: 'hostels#edit'
  patch '/hostels/:id' , to: 'hostels#update'
  delete '/hostels/:id', to: 'hostels#destroy'

end
