Rails.application.routes.draw do
	devise_for :users, controllers: { registrations: "registrations" }
	resources :users
	root 'users#index'
  end
