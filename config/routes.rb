Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new'
  get '/cities/:id', to: 'cities#show'

  get '/hostels', to: 'hostels#index'
  get '/hostels/:id', to: 'hostels#show'

  get '/cities/:id/hostels', to: 'cities#city_hostels'

end
