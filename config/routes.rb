Rails.application.routes.draw do

	root "home#index"

	namespace :admin do
		resource :dashboard, only: [:show]
	end

	resources :users, only: [:new, :create, :show]
	resource :session, only: [:new, :create, :destroy]
	resources :albums
	#resources :favorite_tracks, only: [:create, :destroy, :show]
	#resources :track_playlists, only: [:create, :destroy]
	resources :playlist_tracks
	resources :favorite_tracks
	#resources :track_playlists

	#resources :tracks do
  #put :favorite, on: :member
#end

	get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

	resources :tracks
	resources :artists
	resources :genres
	resources :playlists

	resources :tracks do
		collection do
			post :add_to_playlist
		end
	end

	


end
