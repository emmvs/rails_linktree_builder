Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'dashboard', to: 'dashboard#index'
  get 'appearance', to: 'dashboard#appearance'
  root 'dashboard#index'

  # Gets the id as a parameter to our dashboard_controller within the index action
  # Allows us to use user_path(user) to get the URL for a user's profile page
  get ':id', to: 'dashboard#show', as: :user

  resources :links, only: %i[create update]
end
