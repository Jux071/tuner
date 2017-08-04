Rails.application.routes.draw do

	root "home#index"

	namespace :admin do
		resource :dashboard, only: [:show]
	end

	resources :users, only: [:new, :create, :show]
	resource :session, only: [:new, :create, :destroy]
	resources :albums
	resources :tracks
end
