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

	resource :session, only: [:new, :create, :destroy]
	resource :about, only: [:show]
	resource :contact, only: [:show] 
	resource :privacy, only: [:show] 

	resources :users, only: [:new, :create]	
	resources :albums, only: [:index, :show]
	resources :playlist_tracks
	resources :favorite_tracks
	resources :tracks, only: [:index, :show]
	resources :artists, only: [:index, :show]
	resources :genres, only: [:index, :show]
	resources :playlists	

	get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  match "/404", :to => "errors#error_404", :via => :all
  match "/422", :to => "errors#error_422", :via => :all
	match "/500", :to => "errors#error_500", :via => :all
	
end
