Rails.application.routes.draw do

	root "home#index"

	namespace :admin do
		resource :dashboard, only: [:show]
		resources :albums
		resources :artists
		resources :tracks
		resources :genres
	end

	namespace :superadmin do
		resource :dashboard, only: [:show]
		resources :albums
		resources :artists
		resources :tracks
		resources :genres
	end

	resources :users, only: [:new, :create, :show]
	resource :session, only: [:new, :create, :destroy]
	resources :albums, only: [:index, :show]
	resources :playlist_tracks
	resources :favorite_tracks

	get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

	resources :tracks, only: [:index, :show]
	resources :artists, only: [:index, :show]
	resources :genres, only: [:index, :show]
	resources :playlists
	resource :about, only: [:show]
	resource :contact, only: [:show] 
	resource :privacy, only: [:show] 
	
end
