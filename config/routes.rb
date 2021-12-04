Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new'
  get '/cities/:id', to: 'cities#show'
  get '/cities/:city_id/hostels', to: 'city_hostels#index'
  post '/cities', to: 'cities#create'
  get '/cities/:id/edit', to: 'cities#edit'
  patch '/cities/:id', to: 'cities#update'

  get '/cities/:id/hostels/new', to: 'hostels#new'
  get '/hostels', to: 'hostels#index'
  get '/hostels/:id', to: 'hostels#show'
  post '/hostels', to: 'hostels#create'


end
