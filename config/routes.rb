Rails.application.routes.draw do
  get 'static/error'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'dashboard', to: 'dashboard#index'
  get 'appearance', to: 'dashboard#appearance'
  root 'dashboard#index'

  get 'links/:id/track_click', to: 'links#track_click', as: :track_link_click

  get '/error', to: 'static#error', as: :error

  # Gets the id as a parameter to our dashboard_controller within the index action
  # Allows us to use user_path(user) to get the URL for a user's profile page
  get ':id', to: 'dashboard#show', as: :user

  resources :links, only: %i[create update]
end
