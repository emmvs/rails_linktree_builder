Rails.application.routes.draw do
  get 'pages/about'
  get 'static/error'

  constraints ->(request) { request.env['warden'].user } do
    #              ☝🏻 current HTTP request object
    #                  Returns Raw Reck Env: Rack is a low-level interface between web servers that support Ruby and Ruby frameworks.
    #                          ☝🏻 Essentially, every Rails application is also a Rack application
    #                         .user fetches the currently authenticated user
    root 'dashboards#index', as: :authenticated_root
  end

  root 'pages#about'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  
  get 'dashboards', to: 'dashboards#index'
  get 'appearance', to: 'dashboards#appearance'
  
  
  get 'links/:id/track_click', to: 'links#track_click', as: :track_link_click
  
  get '/error', to: 'static#error', as: :error

  # QR Codes that lead to App Stores
  get '/app_stores', to: 'pages#app_stores', as: :app_stores

  # Gets the id as a parameter to our dashboards_controller within the index action
  # Allows us to use user_path(user) to get the URL for a user's profile page
  get ':id', to: 'dashboards#show', as: :user

  resources :links, only: %i[create update]

  get '/download_vcard/:name', to: 'vcards#download', as: :download_vcard
end
