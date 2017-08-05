Rails.application.routes.draw do

	root "home#index"

	namespace :admin do
		resource :dashboard, only: [:show]
	end

	resources :users, only: [:new, :create, :show]
	resource :session, only: [:new, :create, :destroy]
	resources :albums

	get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

	resources :tracks
	resources :artists
	resources :genres
end
