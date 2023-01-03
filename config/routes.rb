Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'dashboard', to: 'dashboard#admin'
  root 'dashboard#admin'

  # Gets the id as a parameter to our dashboard_controller within the admin action
  # Allows us to use user_path(user) to get the URL for a user's profile page
  get ':id', to: 'dashboard#show', as: :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
