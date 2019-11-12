Rails.application.routes.draw do
  match '/geolocations/:name', to: 'geolocations#show', via: :get, constraints: { name: /.+/ }, as: :geolocation
  match '/geolocations/:name', to: 'geolocations#destroy', via: :delete, constraints: { name: /.+/ }
  resources :geolocations, only: :create
end
