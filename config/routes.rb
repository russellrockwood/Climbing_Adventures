Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'
  get '/areas', to: 'areas#index'
  get '/areas/new', to: 'areas#new'
  post '/areas', to: 'areas#create'
end
