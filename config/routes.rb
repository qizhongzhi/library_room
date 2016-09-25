Rails.application.routes.draw do
  resources :rooms do
	  resources :bookings
	end
	devise_for :users, controllers: { registrations: "registrations" }
	resources :users
  resources :searches
	root 'rooms#index'
  end
