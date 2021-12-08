Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/areas', to: 'areas#index'
  get '/areas/new', to: 'areas#new'
  get '/areas/:id', to: 'areas#show'

  post '/areas', to: 'areas#create'

  get '/areas/:id/edit', to: 'areas#edit'
  patch '/areas/:id', to: 'areas#update'
  delete '/areas/:id', to: 'areas#destroy'

  get '/climbs', to: 'climbs#index'
  get '/climbs/new', to: 'climbs#new'
  get '/climbs/:id', to: 'climbs#show'

  get '/areas/:area_id/climbs', to: 'area_climbs#index'
  # get '/areas/:area_id/climbs/:climb_id', to: 'area_climbs#index'
  get '/areas/:area_id/climbs/new', to: 'area_climbs#new'
  post '/climbs', to: 'area_climbs#create'

  get '/climbs/:id/edit', to: 'climbs#edit'
  patch '/climbs/:id', to: 'climbs#update'
  delete '/climbs/:id', to:'climbs#destroy'


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
