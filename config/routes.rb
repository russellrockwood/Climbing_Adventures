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


# this block was above
  get '/climbs', to: 'climbs#index'
  get '/climbs/new', to: 'climbs#new'
  get '/climbs/:id', to: 'climbs#show'

  # this works - second one doesn't
  # post '/climbs', to: 'climbs#create'
  # this get wasn't here originally
  get '/areas/:area_id/climbs', to: 'area_climbs#index'
  get '/areas/:area_id/climbs/new', to: 'area_climbs#new'
  post '/climbs', to: 'area_climbs#create'
  # post '/areas/:area_id/climbs', to: 'area_climbs#create'

  get '/climbs/:id/edit', to: 'climbs#edit'
  patch '/climbs/:id', to: 'climbs#update'
  delete '/climbs/:id', to:'climbs#destroy'



# this block was below

  # get '/areas/:area_id/climbs/new', to: 'area_climbs#new'
  # get '/areas/:area_id/climbs/new', to: 'area_climbs#new'
  # post '/areas/:area_id/climbs', to: 'area_climbs#create'





  # need the get, patch delete for the climbs


end
