Rails.application.routes.draw do
  get '/studios/:id', to: 'studios#show'

  get '/movies/:id', to: 'movies#show'
  patch '/movies/:id/update', to: 'movies#update'
end
