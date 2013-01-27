MonsterAdventureServer::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  namespace :api, defaults: {format: 'json'} do
    resource :places
    resource :players
  end

  match '/api/players/:uuid', to: 'api/players#show'

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users

end