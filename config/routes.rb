Rails.application.routes.draw do
  resources :rooms do
	  resources :bookings
	end
	devise_for :users, controllers: { registrations: "registrations" }
	resources :users
	#get '/reservations' => 'users#reservations'

	resources :users do
	  member do
	    get 'reservations'
	  end
	end

  resources :searches
	root 'rooms#index'
  end
